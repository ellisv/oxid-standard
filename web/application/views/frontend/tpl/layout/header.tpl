<header role="banner" class="header">
    <div class="header-primary container">
        <button type="button" class="visible-xs-inline-block offcanvas-toggle pull-left" data-toggle="offcanvas" data-target="#[{$offcanvasId}]" data-canvas="body">
            <span class="sr-only">[{oxmultilang ident="TOGGLE_NAVIGATION"}]</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        [{assign var="sLogoImg" value=$oViewConf->getShopLogo()}]
        <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="brand">
            <img src="[{$oViewConf->getImageUrl($sLogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
        </a>
        <nav class="pull-right">
            <ul class="nav nav-pills nav-sm">
                [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
                    [{assign var="blAnon" value=0}]
                    [{assign var="force_sid" value=$oView->getSidForWidget()}]
                [{else}]
                    [{assign var="blAnon" value=1}]
                [{/if}]
                [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                [{if $oxcmp_basket->getProductsCount()}]
                    [{assign var="blAnon" value=0}]
                    [{assign var="force_sid" value=$oView->getSidForWidget()}]
                [{else}]
                    [{assign var="blAnon" value=1}]
                [{/if}]
                [{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]
            </ul>
        </nav>
    </div>
    <div class="header-secondary container hidden-xs">
        <div class="row">
            <nav class="col-lg-9">
                [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]
            </nav>
            <div class="col-lg-3 header-search">
                [{include file="widget/header/search.tpl"}]
            </div>
        </div>
    </div>
</header>

[{if $oView->getClassName() == "start"}]
    [{include file="widget/promoslider.tpl" }]
[{/if}]
