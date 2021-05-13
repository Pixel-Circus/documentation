# [GreenSock Apps (GSAP)](https://greensock.com/docs/v3)

## Créer une animation
Il y a quelques façons de créer une animation en GSAP. Mais habituellement on va vouloir set un style de base, et ensuite le change.

### Créer un trigger
On utilise beaucoup les scrolltrigger pour déclancher des animations a un certain point de la page. La configuration est un array avec 2 éléments principaux. 
- `start`contient 2 mots, qui varient entre top, center et bottom. Le premier représente le container, le 2e la fenêtre. Et en gros quand les 2 éléments se touchent c'est la que l'animation sera déclanchée. Par exemple un top center fera que l'animation se déclanchera quand le top du container touchera le centre de la fenêtre.
- `trigger` contient une référence unique à l'élément qui sera le trigger de l'animation. Soit un sélecteur CSS ou un objet JS.

### Animer via une timeline
````js
var tl = gsap.timeline({
	scrollTrigger:[...trigger...]
})
tl.set(element,{
    //CSS avant que l'animation déclanche
    autoAlpha:0,
    transform:'translateY(100px)'
}).to(element,{
    //CSS après que l'animation déclanche
	autoAlpha:1,
    transform:'translateY(0)'
	//Options de easing et durée.
	ease:easingfunc,
	duration:duration
},delay)
````

### Animer via un tween
````js
var tl = gsap.fromTo(el, {
	autoAlpha:0,
	transform: 'translate(-50%,calc(-50% + 100px))'
},{
	autoAlpha:1,
	transform: "translate(-50%,-50%)",
	//Trigger
	scrollTrigger:[...trigger...],
	//Easing, durée et délai. (Délai semble pas fonctionner, à voir)
	ease:easingfunc,
	duration:duration,
	delay:delay
});
````

## Meilleures pratiques
Lorsque on anime des éléments, il est préférable d'utiliser des éléments qui ne changent pas le flow de la page.

Alors éviter d'animer sur les paddings/margins, des tailles de textes, etc. et préférer les animations sur des choses comme transform et opacity.

Aussi, au lieu d'utiliser Opacity, utiliser autoAlpha, qui va aussi `visibility:hidden` quand on est a opacité 0.

### Optimisation du JS pour GSAP
Plusieurs détails peuvent être optimisés.

1 - Vérifier que il y a peu d'éléments qui trigger sur le scroll.
2 - Faire attention. Toutes les modifications d'éléments coutent. Alors si, par exemple, on met une hauteur calculée a un événement, seulement la changer lorsque nécessaire. Même réassigner la même valeur coute du 'render time'.
3 - Une autre chose qui coute est le chargement d'éléments. Alors simplement faire apparaitre une image (la faire débuter à `opacity:0` à `opacity:1`) causera un hang puisque Chrome ne load pas les images qui ne sont pas affichées d'emblée. Alors faire commencer les animations à partir d'un opacity très bas, mais pas 0. (Par exemple, 0.01)
4- Il est préférable de ajouter un `will-change:transform` sur les éléments qui seront animés. Cela dit au navigateur de se préparer a un changement possible. [Mais il ne faut pas en abuser.](https://developer.mozilla.org/en-US/docs/Web/CSS/will-change)