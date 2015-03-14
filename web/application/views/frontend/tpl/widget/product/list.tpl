[{if !$type}]
    [{assign var="type" value="infogrid"}]
[{/if}]
[{if $head}]
    <h3>[{$head}]</h3>
    [{if $rsslink}]
        <a href="[{$rsslink.link}]" title="[{$rsslink.title}]">RSS Link</a>
    [{/if}]
[{/if}]
[{if $products|@count}]
    <div class="row">
        [{foreach from=$products item=product name=productlist}]
            [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$product->getLinkType() _object=$product anid=$product->getId() sWidgetType=product sListType=listitem_$type blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$product->isInList() skipESIforUser=1}]
        [{/foreach}]
    </div>
[{/if}]
