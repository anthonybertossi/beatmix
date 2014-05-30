---
layout: default
slug: home
---
<div class="row">
    <div class="col-xs-2">
        A1
    </div>
    <div class="col-xs-2">
        B1
    </div>
    <div class="col-xs-2">
        C1
    </div>
    <div class="col-xs-2">
        D1
    </div>
    <div class="col-xs-2">
        E1
    </div>
    <div class="col-xs-2">
        F1
    </div>
</div>
<div class="row">
    <div class="col-xs-2">
        A2
    </div>
    <div class="col-xs-2">
        B2
    </div>
    <div class="col-xs-2">
        C2
    </div>
    <div class="col-xs-2">
        D2
    </div>
    <div class="col-xs-2">
        E2
    </div>
    <div class="col-xs-2">
        F2
    </div>
</div>
<ul class="table-view">
    <li class="table-view-cell">
        <a href="{{site.baseurl}}/favorites.html" class="navigate-right" data-transition="slide-in">Favoris</a>
    </li>
    <li class="table-view-cell">
        <a href="{{site.baseurl}}/profile.html" class="navigate-right" data-transition="slide-in">Profil</a>
    </li>
    <li class="table-view-cell">
        <a href="{{site.baseurl}}/search.html" class="navigate-right" data-transition="slide-in">Recherche</a>
    </li>
    <li class="table-view-cell">
        <a href="{{site.baseurl}}/settings.html" class="navigate-right" data-transition="slide-in">Paramètres</a>
    </li>
</ul>
<ul class="table-view">
{% for p in site.collections.projects.docs %}
    <li class="table-view-cell">
        {{p.name}}
        <span class="pull-right">{{p.realisation_date}}</span>
    </li>
{% endfor %}
</ul>

<ul class="table-view">
    <li class="table-view-cell">
        [ ] coucou
    </li>
    <li class="table-view-cell">
        [x] test
    </li>
</ul>
