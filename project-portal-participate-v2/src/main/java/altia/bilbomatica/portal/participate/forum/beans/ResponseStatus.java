package altia.bilbomatica.portal.participate.forum.beans;

import java.io.Serializable;

public class ResponseStatus implements Serializable {

	// Attributes.
    private static final long serialVersionUID = 9105101106070650773L;
    public boolean ok = false;

	// Constructors.
    public ResponseStatus() {
    }

    public ResponseStatus(boolean ok) {
        super();
        this.ok = ok;
    }

	// Getters.
    public boolean getOk() {
        return ok;
    }

	// Setters.
    public void setOk(boolean ok) {
        this.ok = ok;
    }
}
