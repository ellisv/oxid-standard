<header role="banner">
    <div class="container">
        <button type="button" class="visible-xs-inline-block pull-left" data-toggle="offcanvas" data-target="#[{$offcanvasId}]" data-canvas="body">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        [{assign var="sLogoImg" value=$oViewConf->getShopLogo()}]
        <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
            <img src="[{$oViewConf->getImageUrl($sLogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
        </a>
        <nav class="pull-right">
            <ul class="nav nav-pills">
                <li role="presentation" class="dropdown hidden-xs">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        Account <i class="caret"></i>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Log in</a></li>
                        <li><a href="#">Register</a></li>
                    </ul>
                </li>
                <li role="presentation" class="dropdown hidden-xs">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        EUR <i class="caret"></i>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="active"><a href="#">EUR <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">USD</a></li>
                    </ul>
                </li>
                <li role="presentation" class="dropdown hidden-xs">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        <i class="flag flag-en"></i> <span class="sr-only">English</span> <i class="caret"></i>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="active"><a href="#"><i class="flag flag-en"></i> English <span class="sr-only">(current)</span></a></li>
                        <li><a href="#"><i class="flag flag-de"></i> German</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="icon icon-cart">
                        <span class="badge">0</span>
                        <span class="sr-only">Shopping cart</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="container hidden-xs">
        <div class="row">
            <nav class="col-md-8">
                <ul class="nav nav-pills">
                    <li><a href="#">Kiteboarding <i class="caret"></i></a></li>
                    <li><a href="#">Wakeboarding <i class="caret"></i></a></li>
                    <li><a href="#">Gear <i class="caret"></i></a></li>
                    <li><a href="#">Special Offers (2)</a></li>
                    <li><a href="#">More <i class="caret"></i></a></li>
                </ul>
            </nav>
            <div class="col-md-4">
                <div class="input-group">
                    <input type="search" class="form-control" placeholder="Search">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Go!</button>
                    </span>
                </div>
            </div>
        </div>
    </div>
</header>

[{* <header role="banner">
    <div class="container">
        [{assign var="sLogoImg" value=$oViewConf->getShopLogo()}]
        <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
            <img src="[{$oViewConf->getImageUrl($sLogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
        </a>

        <ul class="nav nav-pills pull-right">
            <li role="presentation" class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                    Account <i class="caret"></i>
                </a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Log in</a></li>
                    <li><a href="#">Register</a></li>
                </ul>
            </li>
            <li role="presentation" class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                    EUR <i class="caret"></i>
                </a>
                <ul class="dropdown-menu" role="menu">
                    <li class="active"><a href="#">EUR <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">USD</a></li>
                </ul>
            </li>
            <li role="presentation" class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                    <i class="flag flag-en"></i> <span class="sr-only">English</span> <i class="caret"></i>
                </a>
                <ul class="dropdown-menu" role="menu">
                    <li class="active"><a href="#"><i class="flag flag-en"></i> English <span class="sr-only">(current)</span></a></li>
                    <li><a href="#"><i class="flag flag-de"></i> German</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="icon icon-cart">
                    <span class="badge">0</span>
                    <span class="sr-only">Shopping cart</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="container">
        <div class="row">
            <nav class="col-md-8">
                <ul class="nav nav-pills">
                    <li><a href="#">Kiteboarding <i class="caret"></i></a></li>
                    <li><a href="#">Wakeboarding <i class="caret"></i></a></li>
                    <li><a href="#">Gear <i class="caret"></i></a></li>
                    <li><a href="#">Special Offers (2)</a></li>
                    <li><a href="#">More <i class="caret"></i></a></li>
                </ul>
            </nav>
            <div class="col-md-4">
                <div class="input-group">
                    <input type="search" class="form-control" placeholder="Search">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Go!</button>
                    </span>
                </div>
            </div>
        </div>
    </div>
</header> *}]
