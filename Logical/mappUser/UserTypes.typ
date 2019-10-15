
TYPE
	ClientInfoType : 	STRUCT 
		userId : WSTRING[80];
		isValid : BOOL;
		ipAddress : WSTRING[15];
		languageId : WSTRING[2];
		screenResolution : WSTRING[32];
		slotId : SINT;
	END_STRUCT;
	userManagementEnum : 
		(
		IdleUser, (*Wait state*)
		DestroyList,
		CreateUser,
		DeleteUser,
		RenameUser,
		ExportList,
		ImportList,
		ChangePassword,
		ComparePassword,
		CreateUserListGetNext,
		CreateUserListGetFirst,
		AssignRole,
		ReleaseRole,
		RoleListMain,
		RoleListDeleteList,
		RoleListInitList,
		CreateRoleListGetFirst,
		CreateRoleListGetNext,
		RoleListGetNext,
		PropertyRead,
		PropertyWrite,
		ErrorUser
		);
	userMAIN : 	STRUCT 
		CMD : userCMD;
		PAR : userPAR;
		DAT : userDAT;
		VIS : ARRAY[0..2]OF userVIS;
		ERR : userERR;
	END_STRUCT;
	userCMD : 	STRUCT 
		UserCreate : BOOL;
		UserDelete : BOOL;
		UserRename : BOOL;
		PasswordChange : BOOL;
		RoleAssign : BOOL;
		RoleRemove : BOOL;
		Import : BOOL;
		Export : BOOL;
		ListRefresh : BOOL;
		ErrorReset : BOOL;
	END_STRUCT;
	userPAR : 	STRUCT 
		FilePath : STRING[80];
		UserName : STRING[40];
		UserNameNew : STRING[40];
		UserRole : STRING[40];
		Password : STRING[40];
		PasswordRepeat : STRING[40];
		VisuSlotID : USINT;
	END_STRUCT;
	userDAT : 	STRUCT 
		Users : ARRAY[0..MaxUserNames]OF userDETAILS;
		Roles : ARRAY[0..MaxUserRoles]OF STRING[40];
		Status : STRING[80];
		UserActive : ARRAY[0..2]OF STRING[40];
	END_STRUCT;
	userVIS : 	STRUCT 
		ListUsers : ARRAY[0..MaxUserNames]OF STRING[80];
		ListUserIndex : UINT;
		ListUserValue : STRING[80];
		ListUserRole : ARRAY[0..MaxUserRoles]OF STRING[80];
		ListUserRoleIndex : UINT;
		ListRoles : ARRAY[0..MaxUserRoles]OF STRING[80];
		ListRoleIndex : UINT;
		RoleDeleteEnabled : BOOL;
		UserDeleteEnabled : BOOL;
		ShowMessageBoxOK : BOOL;
		ShowMessageBoxError : BOOL;
	END_STRUCT;
	userERR : 	STRUCT 
		No : DINT;
		State : userManagementEnum;
		Text : STRING[200];
	END_STRUCT;
	userDETAILS : 	STRUCT 
		Roles : ARRAY[0..9]OF STRING[40];
		Name : STRING[40];
	END_STRUCT;
END_TYPE
