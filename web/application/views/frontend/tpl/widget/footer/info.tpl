[{assign var="aServices" value=$oView->getServicesList()}]
[{assign var="aServiceItems" value=$oView->getServicesKeys()}]
[{block name="footer_information"}]
    <h3>[{oxmultilang ident="INFORMATION"}]</h3>
    <ul>
        [{foreach from=$aServiceItems item=sItem}]
            [{if isset($aServices.$sItem)}]
                <li><a href="[{$aServices.$sItem->getLink()}]">[{$aServices.$sItem->oxcontents__oxtitle->value}]</a></li>
            [{/if}]
        [{/foreach}]
        <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=newsletter"}]" rel="nofollow">[{oxmultilang ident="NEWSLETTER"}]</a></li>
    </ul>
[{/block}]
