package com.meida.model;

import com.meida.model.base.BaseUserFriend;

/**
 * Created by admin on 16/1/2.
 */
public class UserFriend extends BaseUserFriend<UserFriend> {
    public final static String TABLE_NAME = "userFriend";

    //columns
    public final static String userId = "userId",
                               friendId = "friendId";
}
