    .section __TEXT,__text,regular,pure_instructions
    .private_extern "-[AppDelegate setRunBlock:]"
    .globl "-[AppDelegate setRunBlock:]"
"-[AppDelegate setRunBlock:]":
    .cfi_startproc
    pushq %rbx
    .cfi_def_cfa_offset 16
    .cfi_offset %rbx, -16
    testq %rdi, %rdi
    je LBB0_1
    movq %rdi, %rbx
    movq %rsi, %rdi
    callq _objc_retainBlock
    movq 8(%rbx), %rdi
    movq %rax, 8(%rbx)
    popq %rbx
    jmpq *_objc_release@GOTPCREL(%rip)
LBB0_1:
    popq %rbx
    retq
    .cfi_endproc

"-[AppDelegate application:didFinishLaunchingWithOptions:]":

    .cfi_startproc
    pushq %rax
    .cfi_def_cfa_offset 16
    cmpq $0, 8(%rdi)
    je LBB1_2
    movq 8(%rdi), %rsi
    movq __dispatch_main_q@GOTPCREL(%rip), %rdi
    callq _dispatch_async
LBB1_2:
    movb $1, %al
    popq %rcx
    retq
    .cfi_endproc

"-[AppDelegate .cxx_destruct]":

    .cfi_startproc
    addq $8, %rdi
    xorl %esi, %esi
    jmp _objc_storeStrong
    .cfi_endproc

    .section __TEXT,__objc_classname,cstring_literals
L_OBJC_CLASS_NAME_:
    .asciz "AppDelegate"

L_OBJC_CLASS_NAME_.1:
    .asciz "UIApplicationDelegate"

L_OBJC_CLASS_NAME_.2:
    .asciz "NSObject"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_:
    .asciz "isEqual:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_:
    .asciz "B24@0:8@16"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.3:
    .asciz "class"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.4:
    .asciz "#16@0:8"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.5:
    .asciz "self"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.6:
    .asciz "@16@0:8"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.7:
    .asciz "performSelector:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.8:
    .asciz "@24@0:8:16"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.9:
    .asciz "performSelector:withObject:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.10:
    .asciz "@32@0:8:16@24"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.11:
    .asciz "performSelector:withObject:withObject:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.12:
    .asciz "@40@0:8:16@24@32"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.13:
    .asciz "isProxy"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.14:
    .asciz "B16@0:8"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.15:
    .asciz "isKindOfClass:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.16:
    .asciz "B24@0:8#16"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.17:
    .asciz "isMemberOfClass:"

L_OBJC_METH_VAR_NAME_.18:
    .asciz "conformsToProtocol:"

L_OBJC_METH_VAR_NAME_.19:
    .asciz "respondsToSelector:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.20:
    .asciz "B24@0:8:16"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.21:
    .asciz "retain"

L_OBJC_METH_VAR_NAME_.22:
    .asciz "release"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.23:
    .asciz "Vv16@0:8"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.24:
    .asciz "autorelease"

L_OBJC_METH_VAR_NAME_.25:
    .asciz "retainCount"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.26:
    .asciz "Q16@0:8"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.27:
    .asciz "zone"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.28:
    .asciz "^{_NSZone=}16@0:8"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.29:
    .asciz "hash"

L_OBJC_METH_VAR_NAME_.30:
    .asciz "superclass"

L_OBJC_METH_VAR_NAME_.31:
    .asciz "description"

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_NSObject:
    .long 24
    .long 19
    .quad L_OBJC_METH_VAR_NAME_
    .quad L_OBJC_METH_VAR_TYPE_
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.3
    .quad L_OBJC_METH_VAR_TYPE_.4
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.5
    .quad L_OBJC_METH_VAR_TYPE_.6
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.7
    .quad L_OBJC_METH_VAR_TYPE_.8
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.9
    .quad L_OBJC_METH_VAR_TYPE_.10
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.11
    .quad L_OBJC_METH_VAR_TYPE_.12
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.13
    .quad L_OBJC_METH_VAR_TYPE_.14
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.15
    .quad L_OBJC_METH_VAR_TYPE_.16
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.17
    .quad L_OBJC_METH_VAR_TYPE_.16
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.18
    .quad L_OBJC_METH_VAR_TYPE_
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.19
    .quad L_OBJC_METH_VAR_TYPE_.20
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.21
    .quad L_OBJC_METH_VAR_TYPE_.6
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.22
    .quad L_OBJC_METH_VAR_TYPE_.23
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.24
    .quad L_OBJC_METH_VAR_TYPE_.6
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.25
    .quad L_OBJC_METH_VAR_TYPE_.26
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.27
    .quad L_OBJC_METH_VAR_TYPE_.28
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.29
    .quad L_OBJC_METH_VAR_TYPE_.26
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.30
    .quad L_OBJC_METH_VAR_TYPE_.4
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.31
    .quad L_OBJC_METH_VAR_TYPE_.6
    .quad 0

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.32:
    .asciz "debugDescription"

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSObject:
    .long 24
    .long 1
    .quad L_OBJC_METH_VAR_NAME_.32
    .quad L_OBJC_METH_VAR_TYPE_.6
    .quad 0

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_PROP_NAME_ATTR_:
    .asciz "hash"

L_OBJC_PROP_NAME_ATTR_.33:
    .asciz "TQ,R"

L_OBJC_PROP_NAME_ATTR_.34:
    .asciz "superclass"

L_OBJC_PROP_NAME_ATTR_.35:
    .asciz "T#,R"

L_OBJC_PROP_NAME_ATTR_.36:
    .asciz "description"

L_OBJC_PROP_NAME_ATTR_.37:
    .asciz "T@\"NSString\",R,C"

L_OBJC_PROP_NAME_ATTR_.38:
    .asciz "debugDescription"

L_OBJC_PROP_NAME_ATTR_.39:
    .asciz "T@\"NSString\",?,R,C"

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_$_PROP_LIST_NSObject:
    .long 16
    .long 4
    .quad L_OBJC_PROP_NAME_ATTR_
    .quad L_OBJC_PROP_NAME_ATTR_.33
    .quad L_OBJC_PROP_NAME_ATTR_.34
    .quad L_OBJC_PROP_NAME_ATTR_.35
    .quad L_OBJC_PROP_NAME_ATTR_.36
    .quad L_OBJC_PROP_NAME_ATTR_.37
    .quad L_OBJC_PROP_NAME_ATTR_.38
    .quad L_OBJC_PROP_NAME_ATTR_.39

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.40:
    .asciz "B24@0:8@\"Protocol\"16"

L_OBJC_METH_VAR_TYPE_.41:
    .asciz "@\"NSString\"16@0:8"

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_$_PROTOCOL_METHOD_TYPES_NSObject:
    .quad L_OBJC_METH_VAR_TYPE_
    .quad L_OBJC_METH_VAR_TYPE_.4
    .quad L_OBJC_METH_VAR_TYPE_.6
    .quad L_OBJC_METH_VAR_TYPE_.8
    .quad L_OBJC_METH_VAR_TYPE_.10
    .quad L_OBJC_METH_VAR_TYPE_.12
    .quad L_OBJC_METH_VAR_TYPE_.14
    .quad L_OBJC_METH_VAR_TYPE_.16
    .quad L_OBJC_METH_VAR_TYPE_.16
    .quad L_OBJC_METH_VAR_TYPE_.40
    .quad L_OBJC_METH_VAR_TYPE_.20
    .quad L_OBJC_METH_VAR_TYPE_.6
    .quad L_OBJC_METH_VAR_TYPE_.23
    .quad L_OBJC_METH_VAR_TYPE_.6
    .quad L_OBJC_METH_VAR_TYPE_.26
    .quad L_OBJC_METH_VAR_TYPE_.28
    .quad L_OBJC_METH_VAR_TYPE_.26
    .quad L_OBJC_METH_VAR_TYPE_.4
    .quad L_OBJC_METH_VAR_TYPE_.41
    .quad L_OBJC_METH_VAR_TYPE_.41

    .private_extern __OBJC_PROTOCOL_$_NSObject
    .section __DATA,__data
    .globl __OBJC_PROTOCOL_$_NSObject
    .weak_definition __OBJC_PROTOCOL_$_NSObject
    .p2align 3, 0x0
__OBJC_PROTOCOL_$_NSObject:
    .quad 0
    .quad L_OBJC_CLASS_NAME_.2
    .quad 0
    .quad __OBJC_$_PROTOCOL_INSTANCE_METHODS_NSObject
    .quad 0
    .quad __OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSObject
    .quad 0
    .quad __OBJC_$_PROP_LIST_NSObject
    .long 96
    .long 0
    .quad __OBJC_$_PROTOCOL_METHOD_TYPES_NSObject
    .quad 0
    .quad 0

    .private_extern __OBJC_LABEL_PROTOCOL_$_NSObject
    .section __DATA,__objc_protolist,coalesced,no_dead_strip
    .globl __OBJC_LABEL_PROTOCOL_$_NSObject
    .weak_definition __OBJC_LABEL_PROTOCOL_$_NSObject
    .p2align 3, 0x0
__OBJC_LABEL_PROTOCOL_$_NSObject:
    .quad __OBJC_PROTOCOL_$_NSObject

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_$_PROTOCOL_REFS_UIApplicationDelegate:
    .quad 1
    .quad __OBJC_PROTOCOL_$_NSObject
    .quad 0

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.42:
    .asciz "applicationDidFinishLaunching:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.43:
    .asciz "v24@0:8@16"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.44:
    .asciz "application:willFinishLaunchingWithOptions:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.45:
    .asciz "B32@0:8@16@24"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.46:
    .asciz "application:didFinishLaunchingWithOptions:"

L_OBJC_METH_VAR_NAME_.47:
    .asciz "applicationDidBecomeActive:"

L_OBJC_METH_VAR_NAME_.48:
    .asciz "applicationWillResignActive:"

L_OBJC_METH_VAR_NAME_.49:
    .asciz "application:handleOpenURL:"

L_OBJC_METH_VAR_NAME_.50:
    .asciz "application:openURL:sourceApplication:annotation:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.51:
    .asciz "B48@0:8@16@24@32@40"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.52:
    .asciz "application:openURL:options:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.53:
    .asciz "B40@0:8@16@24@32"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.54:
    .asciz "applicationDidReceiveMemoryWarning:"

L_OBJC_METH_VAR_NAME_.55:
    .asciz "applicationWillTerminate:"

L_OBJC_METH_VAR_NAME_.56:
    .asciz "applicationSignificantTimeChange:"

L_OBJC_METH_VAR_NAME_.57:
    .asciz "application:willChangeStatusBarOrientation:duration:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.58:
    .asciz "v40@0:8@16q24d32"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.59:
    .asciz "application:didChangeStatusBarOrientation:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.60:
    .asciz "v32@0:8@16q24"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.61:
    .asciz "application:willChangeStatusBarFrame:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.62:
    .asciz "v56@0:8@16{CGRect={CGPoint=dd}{CGSize=dd}}24"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.63:
    .asciz "application:didChangeStatusBarFrame:"

L_OBJC_METH_VAR_NAME_.64:
    .asciz "application:didRegisterUserNotificationSettings:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.65:
    .asciz "v32@0:8@16@24"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.66:
    .asciz "application:didRegisterForRemoteNotificationsWithDeviceToken:"

L_OBJC_METH_VAR_NAME_.67:
    .asciz "application:didFailToRegisterForRemoteNotificationsWithError:"

L_OBJC_METH_VAR_NAME_.68:
    .asciz "application:didReceiveRemoteNotification:"

L_OBJC_METH_VAR_NAME_.69:
    .asciz "application:didReceiveLocalNotification:"

L_OBJC_METH_VAR_NAME_.70:
    .asciz "application:handleActionWithIdentifier:forLocalNotification:completionHandler:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.71:
    .asciz "v48@0:8@16@24@32@?40"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.72:
    .asciz "application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.73:
    .asciz "v56@0:8@16@24@32@40@?48"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.74:
    .asciz "application:handleActionWithIdentifier:forRemoteNotification:completionHandler:"

L_OBJC_METH_VAR_NAME_.75:
    .asciz "application:handleActionWithIdentifier:forLocalNotification:withResponseInfo:completionHandler:"

L_OBJC_METH_VAR_NAME_.76:
    .asciz "application:didReceiveRemoteNotification:fetchCompletionHandler:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.77:
    .asciz "v40@0:8@16@24@?32"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.78:
    .asciz "application:performFetchWithCompletionHandler:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.79:
    .asciz "v32@0:8@16@?24"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.80:
    .asciz "application:performActionForShortcutItem:completionHandler:"

L_OBJC_METH_VAR_NAME_.81:
    .asciz "application:handleEventsForBackgroundURLSession:completionHandler:"

L_OBJC_METH_VAR_NAME_.82:
    .asciz "application:handleWatchKitExtensionRequest:reply:"

L_OBJC_METH_VAR_NAME_.83:
    .asciz "applicationShouldRequestHealthAuthorization:"

L_OBJC_METH_VAR_NAME_.84:
    .asciz "application:handlerForIntent:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.85:
    .asciz "@32@0:8@16@24"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.86:
    .asciz "application:handleIntent:completionHandler:"

L_OBJC_METH_VAR_NAME_.87:
    .asciz "applicationDidEnterBackground:"

L_OBJC_METH_VAR_NAME_.88:
    .asciz "applicationWillEnterForeground:"

L_OBJC_METH_VAR_NAME_.89:
    .asciz "applicationProtectedDataWillBecomeUnavailable:"

L_OBJC_METH_VAR_NAME_.90:
    .asciz "applicationProtectedDataDidBecomeAvailable:"

L_OBJC_METH_VAR_NAME_.91:
    .asciz "application:supportedInterfaceOrientationsForWindow:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.92:
    .asciz "Q32@0:8@16@24"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.93:
    .asciz "application:shouldAllowExtensionPointIdentifier:"

L_OBJC_METH_VAR_NAME_.94:
    .asciz "application:viewControllerWithRestorationIdentifierPath:coder:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.95:
    .asciz "@40@0:8@16@24@32"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.96:
    .asciz "application:shouldSaveSecureApplicationState:"

L_OBJC_METH_VAR_NAME_.97:
    .asciz "application:shouldRestoreSecureApplicationState:"

L_OBJC_METH_VAR_NAME_.98:
    .asciz "application:willEncodeRestorableStateWithCoder:"

L_OBJC_METH_VAR_NAME_.99:
    .asciz "application:didDecodeRestorableStateWithCoder:"

L_OBJC_METH_VAR_NAME_.100:
    .asciz "application:shouldSaveApplicationState:"

L_OBJC_METH_VAR_NAME_.101:
    .asciz "application:shouldRestoreApplicationState:"

L_OBJC_METH_VAR_NAME_.102:
    .asciz "application:willContinueUserActivityWithType:"

L_OBJC_METH_VAR_NAME_.103:
    .asciz "application:continueUserActivity:restorationHandler:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.104:
    .asciz "B40@0:8@16@24@?32"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.105:
    .asciz "application:didFailToContinueUserActivityWithType:error:"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.106:
    .asciz "v40@0:8@16@24@32"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.107:
    .asciz "application:didUpdateUserActivity:"

L_OBJC_METH_VAR_NAME_.108:
    .asciz "application:userDidAcceptCloudKitShareWithMetadata:"

L_OBJC_METH_VAR_NAME_.109:
    .asciz "application:configurationForConnectingSceneSession:options:"

L_OBJC_METH_VAR_NAME_.110:
    .asciz "application:didDiscardSceneSessions:"

L_OBJC_METH_VAR_NAME_.111:
    .asciz "applicationShouldAutomaticallyLocalizeKeyCommands:"

L_OBJC_METH_VAR_NAME_.112:
    .asciz "window"

L_OBJC_METH_VAR_NAME_.113:
    .asciz "setWindow:"

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_UIApplicationDelegate:
    .long 24
    .long 55
    .quad L_OBJC_METH_VAR_NAME_.42
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.44
    .quad L_OBJC_METH_VAR_TYPE_.45
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.46
    .quad L_OBJC_METH_VAR_TYPE_.45
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.47
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.48
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.49
    .quad L_OBJC_METH_VAR_TYPE_.45
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.50
    .quad L_OBJC_METH_VAR_TYPE_.51
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.52
    .quad L_OBJC_METH_VAR_TYPE_.53
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.54
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.55
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.56
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.57
    .quad L_OBJC_METH_VAR_TYPE_.58
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.59
    .quad L_OBJC_METH_VAR_TYPE_.60
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.61
    .quad L_OBJC_METH_VAR_TYPE_.62
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.63
    .quad L_OBJC_METH_VAR_TYPE_.62
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.64
    .quad L_OBJC_METH_VAR_TYPE_.65
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.66
    .quad L_OBJC_METH_VAR_TYPE_.65
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.67
    .quad L_OBJC_METH_VAR_TYPE_.65
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.68
    .quad L_OBJC_METH_VAR_TYPE_.65
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.69
    .quad L_OBJC_METH_VAR_TYPE_.65
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.70
    .quad L_OBJC_METH_VAR_TYPE_.71
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.72
    .quad L_OBJC_METH_VAR_TYPE_.73
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.74
    .quad L_OBJC_METH_VAR_TYPE_.71
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.75
    .quad L_OBJC_METH_VAR_TYPE_.73
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.76
    .quad L_OBJC_METH_VAR_TYPE_.77
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.78
    .quad L_OBJC_METH_VAR_TYPE_.79
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.80
    .quad L_OBJC_METH_VAR_TYPE_.77
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.81
    .quad L_OBJC_METH_VAR_TYPE_.77
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.82
    .quad L_OBJC_METH_VAR_TYPE_.77
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.83
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.84
    .quad L_OBJC_METH_VAR_TYPE_.85
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.86
    .quad L_OBJC_METH_VAR_TYPE_.77
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.87
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.88
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.89
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.90
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.91
    .quad L_OBJC_METH_VAR_TYPE_.92
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.93
    .quad L_OBJC_METH_VAR_TYPE_.45
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.94
    .quad L_OBJC_METH_VAR_TYPE_.95
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.96
    .quad L_OBJC_METH_VAR_TYPE_.45
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.97
    .quad L_OBJC_METH_VAR_TYPE_.45
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.98
    .quad L_OBJC_METH_VAR_TYPE_.65
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.99
    .quad L_OBJC_METH_VAR_TYPE_.65
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.100
    .quad L_OBJC_METH_VAR_TYPE_.45
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.101
    .quad L_OBJC_METH_VAR_TYPE_.45
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.102
    .quad L_OBJC_METH_VAR_TYPE_.45
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.103
    .quad L_OBJC_METH_VAR_TYPE_.104
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.105
    .quad L_OBJC_METH_VAR_TYPE_.106
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.107
    .quad L_OBJC_METH_VAR_TYPE_.65
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.108
    .quad L_OBJC_METH_VAR_TYPE_.65
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.109
    .quad L_OBJC_METH_VAR_TYPE_.95
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.110
    .quad L_OBJC_METH_VAR_TYPE_.65
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.111
    .quad L_OBJC_METH_VAR_TYPE_
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.112
    .quad L_OBJC_METH_VAR_TYPE_.6
    .quad 0
    .quad L_OBJC_METH_VAR_NAME_.113
    .quad L_OBJC_METH_VAR_TYPE_.43
    .quad 0

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_PROP_NAME_ATTR_.114:
    .asciz "window"

L_OBJC_PROP_NAME_ATTR_.115:
    .asciz "T@\"UIWindow\",?,&,N"

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_$_PROP_LIST_UIApplicationDelegate:
    .long 16
    .long 1
    .quad L_OBJC_PROP_NAME_ATTR_.114
    .quad L_OBJC_PROP_NAME_ATTR_.115

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.116:
    .asciz "v24@0:8@\"UIApplication\"16"

L_OBJC_METH_VAR_TYPE_.117:
    .asciz "B32@0:8@\"UIApplication\"16@\"NSDictionary\"24"

L_OBJC_METH_VAR_TYPE_.118:
    .asciz "B32@0:8@\"UIApplication\"16@\"NSURL\"24"

L_OBJC_METH_VAR_TYPE_.119:
    .asciz "B48@0:8@\"UIApplication\"16@\"NSURL\"24@\"NSString\"32@40"

L_OBJC_METH_VAR_TYPE_.120:
    .asciz "B40@0:8@\"UIApplication\"16@\"NSURL\"24@\"NSDictionary\"32"

L_OBJC_METH_VAR_TYPE_.121:
    .asciz "v40@0:8@\"UIApplication\"16q24d32"

L_OBJC_METH_VAR_TYPE_.122:
    .asciz "v32@0:8@\"UIApplication\"16q24"

L_OBJC_METH_VAR_TYPE_.123:
    .asciz "v56@0:8@\"UIApplication\"16{CGRect={CGPoint=dd}{CGSize=dd}}24"

L_OBJC_METH_VAR_TYPE_.124:
    .asciz "v32@0:8@\"UIApplication\"16@\"UIUserNotificationSettings\"24"

L_OBJC_METH_VAR_TYPE_.125:
    .asciz "v32@0:8@\"UIApplication\"16@\"NSData\"24"

L_OBJC_METH_VAR_TYPE_.126:
    .asciz "v32@0:8@\"UIApplication\"16@\"NSError\"24"

L_OBJC_METH_VAR_TYPE_.127:
    .asciz "v32@0:8@\"UIApplication\"16@\"NSDictionary\"24"

L_OBJC_METH_VAR_TYPE_.128:
    .asciz "v32@0:8@\"UIApplication\"16@\"UILocalNotification\"24"

L_OBJC_METH_VAR_TYPE_.129:
    .asciz "v48@0:8@\"UIApplication\"16@\"NSString\"24@\"UILocalNotification\"32@?<v@?>40"

L_OBJC_METH_VAR_TYPE_.130:
    .asciz "v56@0:8@\"UIApplication\"16@\"NSString\"24@\"NSDictionary\"32@\"NSDictionary\"40@?<v@?>48"

L_OBJC_METH_VAR_TYPE_.131:
    .asciz "v48@0:8@\"UIApplication\"16@\"NSString\"24@\"NSDictionary\"32@?<v@?>40"

L_OBJC_METH_VAR_TYPE_.132:
    .asciz "v56@0:8@\"UIApplication\"16@\"NSString\"24@\"UILocalNotification\"32@\"NSDictionary\"40@?<v@?>48"

L_OBJC_METH_VAR_TYPE_.133:
    .asciz "v40@0:8@\"UIApplication\"16@\"NSDictionary\"24@?<v@?Q>32"

L_OBJC_METH_VAR_TYPE_.134:
    .asciz "v32@0:8@\"UIApplication\"16@?<v@?Q>24"

L_OBJC_METH_VAR_TYPE_.135:
    .asciz "v40@0:8@\"UIApplication\"16@\"UIApplicationShortcutItem\"24@?<v@?B>32"

L_OBJC_METH_VAR_TYPE_.136:
    .asciz "v40@0:8@\"UIApplication\"16@\"NSString\"24@?<v@?>32"

L_OBJC_METH_VAR_TYPE_.137:
    .asciz "v40@0:8@\"UIApplication\"16@\"NSDictionary\"24@?<v@?@\"NSDictionary\">32"

L_OBJC_METH_VAR_TYPE_.138:
    .asciz "@32@0:8@\"UIApplication\"16@\"INIntent\"24"

L_OBJC_METH_VAR_TYPE_.139:
    .asciz "v40@0:8@\"UIApplication\"16@\"INIntent\"24@?<v@?@\"INIntentResponse\">32"

L_OBJC_METH_VAR_TYPE_.140:
    .asciz "Q32@0:8@\"UIApplication\"16@\"UIWindow\"24"

L_OBJC_METH_VAR_TYPE_.141:
    .asciz "B32@0:8@\"UIApplication\"16@\"NSString\"24"

L_OBJC_METH_VAR_TYPE_.142:
    .asciz "@\"UIViewController\"40@0:8@\"UIApplication\"16@\"NSArray\"24@\"NSCoder\"32"

L_OBJC_METH_VAR_TYPE_.143:
    .asciz "B32@0:8@\"UIApplication\"16@\"NSCoder\"24"

L_OBJC_METH_VAR_TYPE_.144:
    .asciz "v32@0:8@\"UIApplication\"16@\"NSCoder\"24"

L_OBJC_METH_VAR_TYPE_.145:
    .asciz "B40@0:8@\"UIApplication\"16@\"NSUserActivity\"24@?<v@?@\"NSArray\">32"

L_OBJC_METH_VAR_TYPE_.146:
    .asciz "v40@0:8@\"UIApplication\"16@\"NSString\"24@\"NSError\"32"

L_OBJC_METH_VAR_TYPE_.147:
    .asciz "v32@0:8@\"UIApplication\"16@\"NSUserActivity\"24"

L_OBJC_METH_VAR_TYPE_.148:
    .asciz "v32@0:8@\"UIApplication\"16@\"CKShareMetadata\"24"

L_OBJC_METH_VAR_TYPE_.149:
    .asciz "@\"UISceneConfiguration\"40@0:8@\"UIApplication\"16@\"UISceneSession\"24@\"UISceneConnectionOptions\"32"

L_OBJC_METH_VAR_TYPE_.150:
    .asciz "v32@0:8@\"UIApplication\"16@\"NSSet\"24"

L_OBJC_METH_VAR_TYPE_.151:
    .asciz "B24@0:8@\"UIApplication\"16"

L_OBJC_METH_VAR_TYPE_.152:
    .asciz "@\"UIWindow\"16@0:8"

L_OBJC_METH_VAR_TYPE_.153:
    .asciz "v24@0:8@\"UIWindow\"16"

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_$_PROTOCOL_METHOD_TYPES_UIApplicationDelegate:
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.117
    .quad L_OBJC_METH_VAR_TYPE_.117
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.118
    .quad L_OBJC_METH_VAR_TYPE_.119
    .quad L_OBJC_METH_VAR_TYPE_.120
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.121
    .quad L_OBJC_METH_VAR_TYPE_.122
    .quad L_OBJC_METH_VAR_TYPE_.123
    .quad L_OBJC_METH_VAR_TYPE_.123
    .quad L_OBJC_METH_VAR_TYPE_.124
    .quad L_OBJC_METH_VAR_TYPE_.125
    .quad L_OBJC_METH_VAR_TYPE_.126
    .quad L_OBJC_METH_VAR_TYPE_.127
    .quad L_OBJC_METH_VAR_TYPE_.128
    .quad L_OBJC_METH_VAR_TYPE_.129
    .quad L_OBJC_METH_VAR_TYPE_.130
    .quad L_OBJC_METH_VAR_TYPE_.131
    .quad L_OBJC_METH_VAR_TYPE_.132
    .quad L_OBJC_METH_VAR_TYPE_.133
    .quad L_OBJC_METH_VAR_TYPE_.134
    .quad L_OBJC_METH_VAR_TYPE_.135
    .quad L_OBJC_METH_VAR_TYPE_.136
    .quad L_OBJC_METH_VAR_TYPE_.137
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.138
    .quad L_OBJC_METH_VAR_TYPE_.139
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.116
    .quad L_OBJC_METH_VAR_TYPE_.140
    .quad L_OBJC_METH_VAR_TYPE_.141
    .quad L_OBJC_METH_VAR_TYPE_.142
    .quad L_OBJC_METH_VAR_TYPE_.143
    .quad L_OBJC_METH_VAR_TYPE_.143
    .quad L_OBJC_METH_VAR_TYPE_.144
    .quad L_OBJC_METH_VAR_TYPE_.144
    .quad L_OBJC_METH_VAR_TYPE_.143
    .quad L_OBJC_METH_VAR_TYPE_.143
    .quad L_OBJC_METH_VAR_TYPE_.141
    .quad L_OBJC_METH_VAR_TYPE_.145
    .quad L_OBJC_METH_VAR_TYPE_.146
    .quad L_OBJC_METH_VAR_TYPE_.147
    .quad L_OBJC_METH_VAR_TYPE_.148
    .quad L_OBJC_METH_VAR_TYPE_.149
    .quad L_OBJC_METH_VAR_TYPE_.150
    .quad L_OBJC_METH_VAR_TYPE_.151
    .quad L_OBJC_METH_VAR_TYPE_.152
    .quad L_OBJC_METH_VAR_TYPE_.153

    .private_extern __OBJC_PROTOCOL_$_UIApplicationDelegate
    .section __DATA,__data
    .globl __OBJC_PROTOCOL_$_UIApplicationDelegate
    .weak_definition __OBJC_PROTOCOL_$_UIApplicationDelegate
    .p2align 3, 0x0
__OBJC_PROTOCOL_$_UIApplicationDelegate:
    .quad 0
    .quad L_OBJC_CLASS_NAME_.1
    .quad __OBJC_$_PROTOCOL_REFS_UIApplicationDelegate
    .quad 0
    .quad 0
    .quad __OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_UIApplicationDelegate
    .quad 0
    .quad __OBJC_$_PROP_LIST_UIApplicationDelegate
    .long 96
    .long 0
    .quad __OBJC_$_PROTOCOL_METHOD_TYPES_UIApplicationDelegate
    .quad 0
    .quad 0

    .private_extern __OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate
    .section __DATA,__objc_protolist,coalesced,no_dead_strip
    .globl __OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate
    .weak_definition __OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate
    .p2align 3, 0x0
__OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate:
    .quad __OBJC_PROTOCOL_$_UIApplicationDelegate

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_CLASS_PROTOCOLS_$_AppDelegate:
    .quad 1
    .quad __OBJC_PROTOCOL_$_UIApplicationDelegate
    .quad 0

    .p2align 3, 0x0
__OBJC_METACLASS_RO_$_AppDelegate:
    .long 389
    .long 40
    .long 40
    .space 4
    .quad 0
    .quad L_OBJC_CLASS_NAME_
    .quad 0
    .quad __OBJC_CLASS_PROTOCOLS_$_AppDelegate
    .quad 0
    .quad 0
    .quad 0

    .section __DATA,__objc_data
    .globl _OBJC_METACLASS_$_AppDelegate
    .p2align 3, 0x0
_OBJC_METACLASS_$_AppDelegate:
    .quad _OBJC_METACLASS_$_NSObject
    .quad _OBJC_METACLASS_$_NSObject
    .quad __objc_empty_cache
    .quad 0
    .quad __OBJC_METACLASS_RO_$_AppDelegate

    .section __TEXT,__objc_classname,cstring_literals
L_OBJC_CLASS_NAME_.154:
    .asciz "\001"

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.155:
    .asciz ".cxx_destruct"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.156:
    .asciz "v16@0:8"

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_$_INSTANCE_METHODS_AppDelegate:
    .long 24
    .long 2
    .quad L_OBJC_METH_VAR_NAME_.46
    .quad L_OBJC_METH_VAR_TYPE_.45
    .quad "-[AppDelegate application:didFinishLaunchingWithOptions:]"
    .quad L_OBJC_METH_VAR_NAME_.155
    .quad L_OBJC_METH_VAR_TYPE_.156
    .quad "-[AppDelegate .cxx_destruct]"

    .private_extern _OBJC_IVAR_$_AppDelegate._runBlock
    .section __DATA,__objc_ivar
    .globl _OBJC_IVAR_$_AppDelegate._runBlock
    .p2align 3, 0x0
_OBJC_IVAR_$_AppDelegate._runBlock:
    .quad 8

    .section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_.157:
    .asciz "_runBlock"

    .section __TEXT,__objc_methtype,cstring_literals
L_OBJC_METH_VAR_TYPE_.158:
    .asciz "@?"

    .section __DATA,__objc_const
    .p2align 3, 0x0
__OBJC_$_INSTANCE_VARIABLES_AppDelegate:
    .long 32
    .long 1
    .quad _OBJC_IVAR_$_AppDelegate._runBlock
    .quad L_OBJC_METH_VAR_NAME_.157
    .quad L_OBJC_METH_VAR_TYPE_.158
    .long 3
    .long 8

    .p2align 3, 0x0
__OBJC_$_PROP_LIST_AppDelegate:
    .long 16
    .long 5
    .quad L_OBJC_PROP_NAME_ATTR_.114
    .quad L_OBJC_PROP_NAME_ATTR_.115
    .quad L_OBJC_PROP_NAME_ATTR_
    .quad L_OBJC_PROP_NAME_ATTR_.33
    .quad L_OBJC_PROP_NAME_ATTR_.34
    .quad L_OBJC_PROP_NAME_ATTR_.35
    .quad L_OBJC_PROP_NAME_ATTR_.36
    .quad L_OBJC_PROP_NAME_ATTR_.37
    .quad L_OBJC_PROP_NAME_ATTR_.38
    .quad L_OBJC_PROP_NAME_ATTR_.39

    .p2align 3, 0x0
__OBJC_CLASS_RO_$_AppDelegate:
    .long 388
    .long 8
    .long 16
    .space 4
    .quad L_OBJC_CLASS_NAME_.154
    .quad L_OBJC_CLASS_NAME_
    .quad __OBJC_$_INSTANCE_METHODS_AppDelegate
    .quad __OBJC_CLASS_PROTOCOLS_$_AppDelegate
    .quad __OBJC_$_INSTANCE_VARIABLES_AppDelegate
    .quad 0
    .quad __OBJC_$_PROP_LIST_AppDelegate

    .section __DATA,__objc_data
    .globl _OBJC_CLASS_$_AppDelegate
    .p2align 3, 0x0
_OBJC_CLASS_$_AppDelegate:
    .quad _OBJC_METACLASS_$_AppDelegate
    .quad _OBJC_CLASS_$_NSObject
    .quad __objc_empty_cache
    .quad 0
    .quad __OBJC_CLASS_RO_$_AppDelegate

    .section __DATA,__objc_classlist,regular,no_dead_strip
    .p2align 3, 0x0
l_OBJC_LABEL_CLASS_$:
    .quad _OBJC_CLASS_$_AppDelegate

    .no_dead_strip __OBJC_LABEL_PROTOCOL_$_NSObject
    .no_dead_strip __OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate
    .no_dead_strip __OBJC_PROTOCOL_$_NSObject
    .no_dead_strip __OBJC_PROTOCOL_$_UIApplicationDelegate
    .section __DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
    .long 0
    .long 96

.subsections_via_symbols
