package personalahorro.jagn.exception;

/**
 * class to manage Exceptions
 *
 */
public class PersonalAhorroException extends Exception {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Instantiates a new modAdministration exception.
     */
    public PersonalAhorroException() {
        super();
    }

    /**
     * Instantiates a new modAdministration exception.
     *
     * @param message
     *            the message
     */
    public PersonalAhorroException(String message) {
        super(message);
    }

    /**
     * Instantiates a new modAdministration exception.
     *
     * @param adm
     *            the adm
     */
    public PersonalAhorroException(Throwable adm) {
        super(adm);
    }

    /**
     * Instantiates a new modAdministration exception.
     *
     * @param message
     *            the message
     * @param adm
     *            the adm
     */
    public PersonalAhorroException(String message, Throwable adm) {
        super(message, adm);
    }

}
