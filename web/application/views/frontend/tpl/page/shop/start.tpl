[{capture append="oxidBlock_content"}]
    <h1>Welcome</h1>

    [{* TODO: Implement widget/product/bargainitem.tpl or remove following snippet }]
    [{* assign var="bargainProducts" value=$oView->getBargainArticleList()}]
    [{if count($bargainProducts) > 0 }]
        [{assign var="bargainProduct" value=$bargainProducts->current()}]
        [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$bargainProduct->getLinkType() _object=$bargainProduct anid=$bargainProduct->getId() isVatIncluded=$oView->isVatIncluded() rsslinks=$oView->getRssLinks() iIteration=0 sWidgetType=product sListType=bargainitem inlist=$bargainProduct->isInList() skipESIforUser=1}]
    [{/if *}]

    [{if $oView->getNewestArticles()}]
        [{assign var="rsslinks" value=$oView->getRssLinks()}]
        [{include file="widget/product/list.tpl" type=$oViewConf->getViewThemeParam("sStartPageListDisplayType") head="JUST_ARRIVED"|oxmultilangassign listId="newItems" products=$oView->getNewestArticles() rsslink=$rsslinks.newestArticles showMainLink=true}]
    [{/if}]
[{/capture}]
[{include file="layout/page.tpl"}]
