[{if $oView->getTagCloudManager()}]
    [{assign var="oCloudManager" value=$oView->getTagCloudManager()}]
    [{assign var="oTagSet" value=$oCloudManager->getCloudArray()}]
    <h3>[{oxmultilang ident="TAGS"}]</h3>
    <div class="tag-cloud">
        [{foreach from=$oTagSet item=oTag}]
            <a data-toggle="tooltip" data-placement="top" aria-haspopup="true" title="[{oxmultilang ident="TOTAL" suffix="COLON"}] [{$oTag->getHitCount()}]" class="tag-cloud-item" href="[{$oTag->getLink()}]">[{$oTag->getTitle()}]</a>
        [{/foreach}]
        [{if $oView->isMoreTagsVisible()}]
            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=tags"}]" class="tag-cloud-item">[{oxmultilang ident="MORE" suffix="ELLIPSIS"}]</a>
        [{/if}]
    </div>
[{/if}]
