package altia.bilbomatica.portal.participate.pur.forms;

import info.magnolia.cms.core.AggregationState;
import info.magnolia.cms.security.SecuritySupport;
import info.magnolia.cms.security.User;
import info.magnolia.cms.security.UserManager;
import info.magnolia.context.MgnlContext;
import info.magnolia.i18nsystem.SimpleTranslator;
import info.magnolia.module.ModuleRegistry;
import info.magnolia.module.form.processors.AbstractFormProcessor;
import info.magnolia.module.form.processors.FormProcessorFailedException;
import info.magnolia.module.publicuserregistration.PublicUserRegistrationConfig;
import info.magnolia.module.publicuserregistration.UserProfile;
import info.magnolia.module.publicuserregistration.UserRegistrar;
import info.magnolia.module.publicuserregistration.configuration.UserProfileConfiguration;
import info.magnolia.objectfactory.Components;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.jcr.Session;
import javax.jcr.Value;
import javax.jcr.LoginException;
import javax.jcr.Node;
import javax.jcr.RepositoryException;

import org.apache.commons.beanutils2.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Abstract Public User Registration processor.
 */
public abstract class AbstractPURProcessor extends AbstractFormProcessor {

    private static Logger log = LoggerFactory.getLogger(AbstractPURProcessor.class);

    private ModuleRegistry moduleRegistry;
    private SimpleTranslator translator;

    /**
     * @deprecated since 2.5, use {@link #AbstractPURProcessor(ModuleRegistry, SimpleTranslator)}.
     */
    @Deprecated
    public AbstractPURProcessor() {
        setModuleRegistry(Components.getComponent(ModuleRegistry.class));
    }

    /**
     * @deprecated  since 2.5.3 use {@link #AbstractPURProcessor(ModuleRegistry, SimpleTranslator)}.
     */
    @Deprecated
    public AbstractPURProcessor(ModuleRegistry moduleRegistry) {
        this(moduleRegistry, Components.getComponent(SimpleTranslator.class));
    }

    @Inject
    public AbstractPURProcessor(ModuleRegistry moduleRegistry, SimpleTranslator translator) {
        this.setModuleRegistry(moduleRegistry);
        this.translator = translator;
    }

    /**
     * Adds a map into the context under the name 'pur' which can be used in other processors in the chain .
     */
    protected void updateContext(User user) {
        Map<String, Object> parameters = new HashMap<String, Object>();

        parameters.put("user", user);

        String uuid = user.getIdentifier();
        parameters.put("userId", uuid);
        String regStamp = user.getProperty("regstamp");
        parameters.put("regStamp", regStamp);

        final AggregationState aggregationState = MgnlContext.getWebContext().getAggregationState();
        final String url = aggregationState.getOriginalURL();
        final String urlWithoutQuery = StringUtils.substringBefore(url, "?");
        final String baseUrl = StringUtils.removeEnd(urlWithoutQuery, aggregationState.getOriginalURI());
        parameters.put("baseUrl", baseUrl);

        MgnlContext.setAttribute("pur", parameters);
    }

    protected UserManager getUserManager(PublicUserRegistrationConfig config) {
        final String realmName = config.getConfiguration().getRealmName();
        return SecuritySupport.Factory.getInstance().getUserManager(realmName);
    }

    protected PublicUserRegistrationConfig getModuleConfig() {
        return (PublicUserRegistrationConfig) moduleRegistry.getModuleInstance("public-user-registration");
    }

    protected void createOrUpdateProfile(Map<String, Object> parameters, boolean newUser) throws FormProcessorFailedException {
        final PublicUserRegistrationConfig config = getModuleConfig();
        UserProfile userProfile = null;
        UserProfileConfiguration userConfiguration = config.getConfiguration().getUserProfileConfiguration();
        Class<? extends UserProfile> userProfileClass = userConfiguration.getUserProfileClass();

        try {
            userProfile = userProfileClass.newInstance();
        } catch (Exception e) {
            log.warn("Cannot instantiate '{}'. Using default " + UserProfile.class, userProfileClass, e);
            userProfile = new UserProfile(); // fallback to default class
        }
        userProfile.setAutopopulatedProperties(userConfiguration.getAutopopulatedProperties());

        if (!newUser) {
            parameters.put(UserProfile.USERNAME, MgnlContext.getUser().getName());
        }

        this.setUserProfileProperties(userProfile, parameters);
        if (parameters.get("interests")!=null) {
        	Session session;
			try {
				session = MgnlContext.getJCRSession("users");
				Node node = session.getNodeByUUID(MgnlContext.getUser().getIdentifier());
				node.setProperty("interests", (String) parameters.get("interests"));
				node.getSession().save();
			} catch (LoginException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (RepositoryException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
        }

        UserRegistrar userRegistrar = UserRegistrar.Factory.getInstance();
        Map<String, String> errorMessages = null;
        if (newUser) {
            errorMessages = userRegistrar.validateForCreation(userProfile, config);
        } else {
            errorMessages = userRegistrar.validateForUpdate(userProfile, config);
        }

        if (!errorMessages.isEmpty()) {
            String msg = translator.translate("validation.constraints.violation") + "\n<ul>";

            for (String fieldName : errorMessages.keySet()) {
                msg += "<li>" + fieldName + ": " + translator.translate(errorMessages.get(fieldName)) + "</li>\n";
            }
            msg += "</ul>";
            throw new FormProcessorFailedException(msg);
        }

        if (newUser) {
            User user = userRegistrar.registerUser(userProfile, config);
            updateContext(user);
        } else {
            userRegistrar.updateProfile(userProfile, config);
        }
    }

    /**
     * Override this to set extra properties from your custom {@link UserProfile} class.
     */
    protected void setUserProfileProperties(UserProfile userProfile, Map<String, Object> parameters) {
        userProfile.setUsername((String) parameters.get(UserProfile.USERNAME));
        userProfile.setPassword((String) parameters.get(UserProfile.PASSWORD));
        userProfile.setFullName((String) parameters.get(UserProfile.FULLNAME));
        userProfile.setEmail((String) parameters.get(UserProfile.EMAIL));

        Map<String, Object> properties = new HashMap<String, Object>();
        for (String property : userProfile.getAutopopulatedProperties()) {
            properties.put(property, parameters.get(property));
        }

        try {
            BeanUtils.populate(userProfile, properties);
        } catch (IllegalAccessException e) {
            log.error("Cannot populate {} with extra properties: {}.", new Object[] { userProfile.getClass().getName(), properties, e });
        } catch (InvocationTargetException e) {
            log.error("Cannot populate {} with extra properties: {}.", new Object[] { userProfile.getClass().getName(), properties, e });
        }
    }

    public void setModuleRegistry(ModuleRegistry moduleRegistry) {
        this.moduleRegistry = moduleRegistry;
    }

    protected SimpleTranslator getTranslator() {
        return this.translator;
    }
}
