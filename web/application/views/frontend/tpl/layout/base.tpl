[{capture append="oxidBlock_pageHead"}]
    <meta charset="[{$oView->getCharSet()}]">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>[{block name="head_title"}][{$oView->getPageTitle()}][{/block}]</title>

    [{block name="head_meta_robots"}]
        [{if $oView->noIndex() == 1}]
            <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
        [{elseif $oView->noIndex() == 2}]
            <meta name="ROBOTS" content="NOINDEX, FOLLOW">
        [{/if}]
    [{/block}]

    [{block name="head_meta_description"}]
        [{if $oView->getMetaDescription()}]
            <meta name="description" content="[{$oView->getMetaDescription()}]">
        [{/if}]
    [{/block}]

    [{block name="head_meta_keywords"}]
        [{if $oView->getMetaKeywords()}]
            <meta name="keywords" content="[{$oView->getMetaKeywords()}]">
        [{/if}]
    [{/block}]

    [{block name="head_meta_open_graph"}]
        [{if $oViewConf->getFbAppId()}]
            <meta property="og:site_name" content="[{$oViewConf->getBaseDir()}]">
            <meta property="fb:app_id" content="[{$oViewConf->getFbAppId()}]">
            <meta property="og:title" content="[{$oView->getPageTitle()}]">
            [{if $oViewConf->getActiveClassName() == "details"}]
                <meta property="og:type" content="product">
                <meta property="og:image" content="[{$oView->getActPicture()}]">
                <meta property="og:url" content="[{$oView->getCanonicalUrl()}]">
            [{else}]
                <meta property="og:type" content="website">
                <meta property="og:image" content="[{$oViewConf->getImageUrl('basket.png')}]">
                <meta property="og:url" content="[{$oViewConf->getCurrentHomeDir()}]">
            [{/if}]
        [{/if}]
    [{/block}]

    [{assign var="canonical_url" value=$oView->getCanonicalUrl()}]
    [{block name="head_link_canonical"}]
        [{if $canonical_url}]
            <link rel="canonical" href="[{$canonical_url}]">
        [{/if}]
    [{/block}]

    [{block name="head_link_favicon"}]
        <link rel="shortcut icon" href="[{$oViewConf->getImageUrl('favicon.ico')}]">
    [{/block}]

    [{assign var="rsslinks" value=$oView->getRssLinks()}]
    [{block name="head_link_rss"}]
        [{if $rsslinks}]
            [{foreach from=$rsslinks item="rssentry"}]
                <link rel="alternate" type="application/rss+xml" title="[{$rssentry.title|strip_tags}]" href="[{$rssentry.link}]">
            [{/foreach}]
        [{/if}]
    [{/block}]

    [{oxstyle include="css/app.css"}]
[{/capture}]
<!doctype html>
[{assign var="sLanguage" value=$oView->getActiveLangAbbr()}]
<html[{if $sLanguage}] lang="[{$sLanguage}]"[{/if}][{if $oViewConf->getShowFbConnect()}] xmlns:fb="http://www.facebook.com/2008/fbml"[{/if}]>
<head>
    [{foreach from=$oxidBlock_pageHead item="_block"}]
        [{$_block}]
    [{/foreach}]

    [{oxstyle}]

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    [{foreach from=$oxidBlock_pagePopup item="_block"}]
        [{$_block}]
    [{/foreach}]
    [{foreach from=$oxidBlock_pageBody item="_block"}]
        [{$_block}]
    [{/foreach}]

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="[{$oViewConf->getResourceUrl('js/jquery.js')}]"><\/script>')</script>
    [{oxscript include="js/app.js" priority=1}]
    [{oxscript}]
</body>
</html>
