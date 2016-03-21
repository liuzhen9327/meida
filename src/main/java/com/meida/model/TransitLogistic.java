package com.meida.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.ICallback;
import com.meida.model.base.BaseTransitLogistic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by liuzhen on 2015/12/25.
 * CREATE TABLE `transitLogistic` (
 `id` bigint(20) NOT NULL auto_increment,
 `name` varchar(50) NOT NULL COMMENT '物流名称',
 `number` varchar(50) NOT NULL COMMENT '物流号',
 `type` INT NOT NULL COMMENT '1拆包 2原装转发',
 `contactInfo` VARCHAR (200),
 `weight` decimal(6,2) NOT NULL,
 `remark` varchar(200),
 `orderId` bigint(20) NOT NULL,
 `originalId` bigint(20) NOT NULL DEFAULT 0,
 `sendTime` bigint(13) default null,
 `deleteFlag` BIT DEFAULT 0,
 `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 `creater` bigint(20) NOT NULL ,
 `updateTime` TIMESTAMP NOT NULL,
 `updater` bigint(20) NOT NULL ,
 PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
 */
public class TransitLogistic extends BaseTransitLogistic<TransitLogistic> {
    public final static String TABLE_NAME = "transitLogistic";

    public final static TransitLogistic dao = new TransitLogistic();

    public final static String name = "name",
                               number = "number",
                               weight = "weight",
                               type = "type",
                               contactInfo = "contactInfo",
                               originalId = "originalId",
                               originalNumber = "originalNumber",
                               originalMobile = "originalMobile",
                               remark = "remark",
                               orderId = "orderId",
                               sendTime = "sendTime";

    public final static String sql_findAll = "select * from " + TABLE_NAME;
    public final static String sql_findByOriginalId = sql_findAll + " where " + originalId + "=? order by id desc";
    public final static String sql_findByOriginalIdAndMobile = sql_findByOriginalId + " and " + originalMobile + "=? order by id desc";
    public final static String sql_findByOrderId = sql_findAll + " where " + orderId + "=?";

    public void deleteAll(final long userId) {
        Db.execute(new ICallback() {
            @Override
            public Object call(Connection conn) throws SQLException {
                PreparedStatement st = null;
                st = conn.prepareStatement("delete from transitLogistic where creater=?");
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
