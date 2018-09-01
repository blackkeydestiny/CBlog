<#include "include/macros.ftl">
<@header title="关于 | ${config.siteName}"
    keywords="${config.siteName},关于博客"
    description="一个程序员的个人博客,关于我的个人原创博客 - ${config.siteName}"
    canonical="/about">
</@header>

<div class="container custome-container">
    <#--面包屑: 首页 > 关于-->
    <nav class="breadcrumb">
        <a class="crumbs" title="返回首页" href="${config.siteUrl}" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-home"></i>首页</a>
        <i class="fa fa-angle-right"></i>关于
    </nav>

    <div class="row">
        <#--宏: hitokoto、QQ、邮箱、微博-->
        <@blogHeader title="关于本站"></@blogHeader>
        <div class="col-sm-12 blog-main">
            <div class="blog-body expansion">

                <#--博主简介-->
                <h5 class="legend-title">博主简介</h5>
                <div class="info">
                    <p>
                        码农一枚
                    </p>
                </div>

                <#--关于博客-->
                <h5 class="legend-title">关于博客</h5>
                <div class="info">
                        本站为非商业化站点，无盈利性质，为博主个人博客。<br>
                </div>

                <#--关于版权-->
                <h5 class="legend-title">关于版权</h5>
                <div class="info">
                    本站所有标注为原创的文章，转载请标明出处。<br>
                    本站所有转载的文章，一般都会在文章中注明原文出处。<br>
                    所有转载的文章皆来源于互联网，若因此对原作者造成侵权，烦请原作者<a target="_blank" href="mailto:${config.authorEmail}" title="点击给我发邮件" data-toggle="tooltip" data-placement="bottom" rel="external nofollow"><strong>告知</strong></a>，我会立刻删除相关内容。
                </div>

                <#--赞助-->
                <h5 class="legend-title">赞助</h5>
                <div class="alert alert-warning alert-dismissible simple-alert fade-in" role="alert">
                    <strong>注!</strong> 如果您觉得我的网站能够帮助到您，请您多多支持。我的支付宝账号：<span class="label label-success">17688759175</span>（#==@）！
                    扫码点击：<a class="btn btn-danger btn-sm reward" onclick="PaymentUtils.show();">打赏</a>
                </div>
            </div>
        </div>
        <#--<div class="col-sm-12 blog-main">
            <div class="blog-body expansion">
                <div id="comment-box" data-id="-3"></div>
            </div>
        </div>-->
    </div>
</div>

<@footer>
    <script src="https://v1.hitokoto.cn/?encode=js&c=d&select=%23hitokoto" defer></script>
</@footer>
