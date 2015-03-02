[{if $oView->showSearch()}]
    <form action="[{$oViewConf->getSelfActionLink()}]" method="get" name="search" role="search" class="navmenu-form">
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="cl" value="search">
        [{assign var="currency" value=$oView->getActCurrency()}]
        [{if $currency->id}]
            <input type="hidden" name="cur" value="[{$currency->id}]">
        [{/if}]
        <div class="input-group">
            <input type="search" class="form-control" name="searchparam" placeholder="[{oxmultilang ident="SEARCH"}]" value="[{$oView->getSearchParamForHtml()}]">
            <span class="input-group-btn">
                <button class="btn btn-default" type="button">
                    <i class="glyphicon glyphicon-search"></i>
                    <span class="sr-only">Search</span>
                </button>
            </span>
        </div>
    </form>
[{/if}]
