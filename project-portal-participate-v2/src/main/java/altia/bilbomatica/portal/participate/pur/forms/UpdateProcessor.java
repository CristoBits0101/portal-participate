package altia.bilbomatica.portal.participate.pur.forms;

import info.magnolia.module.ModuleRegistry;
import info.magnolia.module.form.processors.FormProcessorFailedException;

import java.util.Map;

import javax.inject.Inject;
import javax.jcr.Node;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Processor for user account update.
 */
public class UpdateProcessor extends AbstractPURProcessor {

    private static final Logger log = LoggerFactory.getLogger(UpdateProcessor.class);

    /**
     * @deprecated use {@link #UpdateProcessor(ModuleRegistry)}
     */
    public UpdateProcessor() {
    }

    @Inject
    public UpdateProcessor(ModuleRegistry moduleRegistry) {
        super(moduleRegistry);
    }

    @Override
    protected void internalProcess(Node content, Map<String, Object> parameters) throws FormProcessorFailedException {
        this.createOrUpdateProfile(parameters, false);
    }
}
