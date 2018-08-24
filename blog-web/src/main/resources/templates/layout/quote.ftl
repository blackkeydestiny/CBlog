    <link href="${config.siteFavicon}" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/jquery-confirm/2.5.1/jquery-confirm.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/fancybox/2.1.5/jquery.fancybox.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.1/css/bootstrapValidator.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/nprogress/0.2.0/nprogress.min.css" rel="stylesheet">
    <#if config.themeColor?if_exists>
        <#if config.themeColor?string == "2">
            <link href="${config.staticWebSite}/css/ccm.core.purple.css" rel="stylesheet" type="text/css">
            <link href="${config.staticWebSite}/css/ccm.comment.purple.css" rel="stylesheet" type="text/css">
        <#else>
            <link href="${config.staticWebSite}/css/ccm.core.css" rel="stylesheet" type="text/css">
            <link href="${config.staticWebSite}/css/ccm.comment.css" rel="stylesheet" type="text/css">
        </#if>
    <#else>
        <link href="${config.staticWebSite}/css/ccm.core.css" rel="stylesheet" type="text/css">
        <link href="${config.staticWebSite}/css/ccm.comment.css" rel="stylesheet" type="text/css">
    </#if>

