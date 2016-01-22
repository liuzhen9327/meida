package com.meida.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.ICallback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by admin on 16/1/22.
 */
public class So extends BaseModel<So> {
    /*
    DROP TABLE IF EXISTS `so`;
CREATE TABLE `so` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(50) NOT NULL COMMENT '订单号',
  `originalName` VARCHAR(50) NOT NULL,
  `originalNumber` VARCHAR(50) NOT NULL,
  `weight` decimal(6,2),
  `transitLogisticInfo` TEXT,
  `receiver` VARCHAR(50),
  `mobile` VARCHAR(50),
  `address` TEXT,
  `transitName` VARCHAR(50),
  `transitNumber` VARCHAR(50) NOT NULL,
  `deleteFlag` BIT DEFAULT 0,
  `createTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `creater` BIGINT(20) NOT NULL ,
  `updateTime` TIMESTAMP NOT NULL,
  `updater` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;
     */
    public final static String TABLE_NAME = "so";

    public final static String number = "number",
                                originalName = "originalName",
                                originalNumber = "originalNumber",
                                weight = "weight",
                                transitLogisticInfo = "transitLogisticInfo",
                                receiver = "receiver",
                                mobile = "mobile",
                                address = "address",
                                transitName = "transitName",
                                transitNumber = "transitNumber";

    public final static So dao = new So();

    public static void deleteData(final long id) {
        Db.execute(new ICallback() {
            @Override
            public Object call(Connection conn) throws SQLException {
                PreparedStatement st = null;
                st = conn.prepareStatement("delete from so where id<?");
                st.setObject(1, id);
                return st.executeUpdate();
            }
        });
    }

    @Override
    public String toString() {
        return new StringBuilder().append(getStr(originalName)).append("&nbsp;&nbsp;")
                .append(getStr(originalNumber)).append("&nbsp;&nbsp;")
                .append(getStr(weight)).append("KG").toString();
    }
}
