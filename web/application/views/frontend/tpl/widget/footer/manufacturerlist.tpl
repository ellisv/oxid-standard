[{assign var="iManufacturerLimit" value="10"}]
[{assign var="manufacturers" value=$oView->getManufacturerlist()}]
[{if $manufacturers|count}]
    [{block name="footer_manufacturers"}]
        <h3>[{oxmultilang ident="MANUFACTURERS"}]</h3>
        <ul>
            [{assign var="rootManufacturer" value=$oView->getRootManufacturer()}]
            <li><a href="[{$rootManufacturer->getLink()}]">[{oxmultilang ident="ALL_BRANDS"}]</a></li>
            [{foreach from=$manufacturers item=manufacturer name=manufacturers}]
                [{if $smarty.foreach.manufacturers.index < $iManufacturerLimit}]
                    <li><a href="[{$manufacturer->getLink()}]">[{$manufacturer->oxmanufacturers__oxtitle->value}]</a></li>
                [{elseif $smarty.foreach.manufacturers.index == $iManufacturerLimit}]
                    <li><a href="[{$rootManufacturer->getLink()}]">[{oxmultilang ident="MORE"}]</a></li>
                [{/if}]
            [{/foreach}]
        </ul>
    [{/block}]
[{/if}]
