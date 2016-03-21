package com.meida.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.ICallback;
import com.meida.model.base.BaseReceiver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by admin on 16/2/3.
 */
public class Receiver extends BaseReceiver<Receiver> {

    public final static Receiver dao = new Receiver();

    public static final String TABLE_NAME = "receiver",
            name = "name",
            mobile = "mobile",
            address = "address",
            originalId = "originalId",
            originalNumber = "originalNumber";

    public Receiver(){}
    public Receiver(Object name, Object mobile, Object address, Object originalId, Object originalNumber, Object creater) {
        set(Receiver.name, name);
        set(Receiver.mobile, mobile);
        set(Receiver.address, address);
        set(Receiver.originalId, originalId);
        set(Receiver.originalNumber, originalNumber);
        setCreater(creater == null ? 0l:Long.valueOf(creater.toString()));
    }

    public void deleteAll(final long userId) {
        Db.execute(new ICallback() {
            @Override
            public Object call(Connection conn) throws SQLException {
                PreparedStatement st = null;
                st = conn.prepareStatement("delete from receiver where creater=?");
                st.setObject(1, userId);
                return st.executeUpdate();
            }
        });
    }
    private int line;

    public int getLine() {
        return line;
    }

    public void setLine(int line) {
        this.line = line;
    }
}
