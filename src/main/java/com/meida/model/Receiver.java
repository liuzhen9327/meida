package com.meida.model;

/**
 * Created by admin on 16/2/3.
 */
public class Receiver extends BaseModel<Receiver> {
    public static final String TABLE_NAME = "receiver",
            name = "name",
            mobile = "mobile",
            address = "address",
            originalId = "originalId",
            originalNumber = "originalNumber";

    public Receiver(Object name, Object mobile, Object address, Object originalId, Object originalNumber) {
        set(Receiver.name, name);
        set(Receiver.mobile, mobile);
        set(Receiver.address, address);
        set(Receiver.originalId, originalId);
        set(Receiver.originalNumber, originalNumber);
    }
}
