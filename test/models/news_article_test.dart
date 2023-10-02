import 'package:flutter_test/flutter_test.dart';

import 'package:guardian_dock/api/models/news_article.dart';

void main() {
  test('News Article Creation Test', () {
    var json = {
      "Title": "Cette semaine dans Destiny - 28/09/2023",
      "Link": "/7/fr/News/Article/9-28-23-twid",
      "PubDate": "2023-09-28T18:00:00Z",
      "UniqueIdentifier": "blt1ba2f6362f2abedb",
      "Description": "Cette semaine dans Destiny, nous avons abordé la concentration de l'Armurier et eu un aperçu des mises à jour d'Échec et mat. ",
      "HtmlContent": "<p>Joyeux CSDD, Gardiens ! Nous sommes de retour cette semaine avec de nouveaux aperçus et de nouvelles récompenses à obtenir ! L'histoire de la Saison de la Sorcière vous plaît ? Combien d'Autels avez-vous terminé jusqu'à maintenant ? Des avis sur Échec et mat ? En parlant d'Échec et mat, continuez à lire si vous voulez découvrir les changements à venir ! N'oubliez pas de nous contacter sur les réseaux sociaux, pour que nous puissions lire vos commentaires ! </p><p>Tout d'abord, voici un rappel du contenu du CSDD de la semaine dernière.</p><ul><li>La campagne « Chef largueur » débarque.</li><li>Création d'armes : que s'est-il passé ?!</li><li>Recul prédéfini : on vous explique son intérêt. </li><li>Des aventures vous attendent à la Chambre au trésor.</li><li>Il paraît que vous voulez un catalyseur de Chardon…</li><li>Le Cœur pâle vous attend. </li><li>L'équipe s'est un peu trop amusée avec les nouveaux Supers de La Forme Finale.</li><li>Un peu de lo-fi, ça aide toujours… surtout en compagnie d'Eris ! </li><li>Mise à jour Prime Gaming.</li><li>Balancez le petit Éliksni (vidéo humoristique).</li></ul><p>Sujets de la semaine : </p><ul><li>De nouvelles récompenses à obtenir.</li><li>Un aperçu de la mise à jour des armes Échec et mat de la semaine prochaine.</li><li>Concentration d'engrammes de l'<span>Armurier</span>.</li></ul><h2>Récompenses du Jugement et de Nuit noire</h2><p>Avez-vous déjà plongé dans la Nuit noire de cette semaine ? Si ce n'est pas le cas, il y a un nouvel arc de précision à obtenir ! En parlant de nouvelles armes, lorsque le Jugement reviendra ce week-end, un nouveau lance-grenades sera également disponible ! Regardons ce qui vient.</p><p></p><img src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt6d3665c06df03a64/6514c0eab0132a214d6fa359/TP_2023_S22_TWID_Bow_02.jpg\"/><p>Nouvel arc de Nuit noire : Pré-Astyanax IV</p><ul><li>Arc de précision : Solaire (Fonderie Cassoïde)</li><li>Colonne de gauche : Mouvement perpétuel, Cadence de l'archer, Flottement parfait, Tir pour butin, Action illuminée, Télémètre</li><li>Colonne de droite : Incandescent, Action collective, Échauffement réussi, Premier tir, Pointe explosive, Instrument de précision</li></ul><p></p><img src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt9f776a6cff664ec8/6514c0f4f864d5b4b36387ac/d2_TWID_20230928_GrenadeLauncher_16x9.jpg\"/><p>Nouveau lance-grenades du Jugement - Cataphractaire GL3</p><ul><li>Lance-grenades lourd adaptatif - Filobscur (Fonderie Omolon)</li><li>Colonne de gauche : Amplificateur d'impulsion, Envie assassine, Prêt pour le terrain, Saisie habile, Action illuminée, Holster de recharge auto, Démolisseur</li><li>Colonne de droite : Point de cascade, Réaction en chaîne, Lumière explosive, Petit, Fond de cour, Arme vorpale, Publicité mensongère</li></ul><h2>Mise à jour des armes Échec et mat </h2><p>Pour l'ajustement des armes Échec et mat, nous voulions nous assurer que nos options d'armes à munitions principales à moyenne portée disposaient d'espace pour manœuvrer, alors nous avons équilibré les autres types d'armes de façon pour conservative. La raison de cette décision est apparue dans les premiers tests de jeu, lorsqu'il est rapidement devenu apparent dans la sandbox que la réduction du temps de récupération pour les munitions spéciales et les compétences créaient un problème en jeu. Avec la plupart des contres qui ne voient plus suffisamment le jour, cela permettait des temps-par-frag (TPF) très rapides avec des armes à munitions principales qui étaient soient à longue portée soit à courte portée. Il devenait de plus en plus compliqué de lancer une offensive avec des pistolets-mitrailleurs et des pistolets puisque les joueurs savaient que les armes à munitions principales ne pouvaient pas tuer aussi rapidement et que les options de moyenne portée avaient du mal à se faire une place. De façon similaire, nous avons réduit les dégâts des armes principales à courte-portée pour les ajuster aux options à mi-distance, car les fusils d'éclaireur devenaient ingérables sans la menace des fusils de précision afin d'empêcher les joueurs de rester à très longue portée. </p><p>De plus, nous voulions éviter de faire des changements drastiques au TPF, par exemple avec des choses comme 140 revolvers prenant 4 coups pour tuer, alors nous avons limité l'évolution du TPF dans son ensemble. Après avoir vu Échec et mat en action pendant une semaine, nous avons vu qu'il y avait un écart substantiel entre les performances du revolver et le reste des arme à munitions principales du sandbox. Tout en conservant à l'esprit notre idée d'origine de permettre aux armes à moyenne portée de briller dans ce mode, nous créons un ensemble limité d'équilibrages conçu pour réduire l'écart sans l'accélérer le TPF des armes à munitions principales Par exemple, les pistolets-mitrailleurs et pistolets ne verront pas leur TPF redescendre en dessous des 0,80 s en raison du total de santé des joueurs, mais nous voulions leur fournir une marge d'erreur et encourager une certaine diversité dans les choix d'armes. Les armes comme les fusils à impulsion adaptatifs et à haute impulsion sont revenues à leur TPF optimal, tandis que la plupart des autres armes ont été légèrement modifiées. Bien que la plupart de nos modifications soient tournées sur l'amélioration de nouveaux archétypes d'arme à munitions principales, nous allons réduire les dégâts du revolver. Cela n'aura pas d'impact sur leur TPF optimal face à une résistance classique mais aura plutôt un impact sur la réduction de portée et la réduction du droit à l'erreur et de l'efficacité face à des cibles avec une résistance augmentée. Nous allons jouer avec ces modifications en jeu avec vous et nous continuerons les modifications dans le sandbox selon les besoins.</p><p></p><p>Voici les nouvelles modifications d'armes à venir dans Échec et mat la semaine prochaine :</p><p>Pénalité de dégâts augmentée pour : </p><ul><li>Rayon laser de Ruines du Diable : 10 % à 15 %</li><li>Lion de guerre : 0 % à 20 %</li><li>Arcs : 0 % à 10 %</li></ul><p>Pénalité de dégâts réduite pour : </p><ul><li>Pistolets : 10 % à 5 %</li><li>Pistolets-mitrailleurs : 5 % à 10 %</li><li>Fusils d'éclaireur : 10 % à 9 %</li></ul><p>Augmentation du bonus de dégâts pour : </p><ul><li>Fusils automatiques : 0 % à 2 %</li><li>Fusils automatiques : 0 % à 5 %</li></ul><p>Réduction du bonus de dégâts pour : </p><ul><li>Revolver : 10 % à 7 %</li></ul><p>Correction d'un problème qui permettait à Exégèse du Vex de bénéficier du bonus de dégâts des fusils à fusion à munitions spéciales.</p><h2>La concentration de l'<span>Armurier</span> arrive en ville</h2><p></p><img src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt24839b03102db6f2/6515b8bbd45f29eaa100bbb7/Foundry_Composite.jpg\" height=\"auto\"/><p>À partir de la Saison 23, Banshee-44 disposera d'options de concentration pour certaines armes de fonderie. La concentration de l'Armurier est conçue pour offrir aux joueurs qui cherchent à réaliser leur rêve d'obtenir des armes de fonderie plus anciennes tout en réduisant la quantité d'éléments légendaires.</p><h4>Quelles armes seront disponibles ?</h4><p>Les options de concentration disponibles auprès de Banshee-44 s'appliqueront aux armes des saisons 16 à 19, ce qui signifie que ces armes ont au moins <strong>quatre saisons d'ancienneté</strong> (environ 1 an). Ces armes ne seront <strong>plus disponibles dans les butins d'engrammes légendaires du jeu</strong> et seront désormais <strong>uniquement disponibles dans les engrammes de l'Armurier et avec la concentration.</strong></p><p>Saison 23 de l'Armurier et concentration :</p><p><strong>Suros</strong></p><ul><li>Cantate-57</li><li>Syncope-53</li><li>Fugue-55</li><li>Staccato-46</li><li>Pizzicato-22</li><li>Fioritura-59</li></ul><p><strong>Häkke</strong></p><ul><li>Palmyra-B</li><li>Persès-D</li><li>Ragnhild-D</li><li>Enyo-D</li><li>Boudica-C</li><li>Lodbrok-C</li></ul><p><strong>Veist</strong></p><ul><li>Krait</li><li>Redback-5si</li><li>Toile-entonnoir</li><li>Lunulata-4b</li><li>Taipan-4fr</li><li>Jararaca-3sr</li></ul><p><strong>Omolon</strong></p><ul><li>Snorri FF5</li><li>Typhon LG5</li><li>Ogma FI6</li><li>Gallu RR3</li><li>Ammit AR2</li><li>Aurvandil FR6</li></ul><p>Dans la Saison 24, nous avons prévu de mettre cette liste à jour avec des armes de la Saison 20 pour les fonderies existantes ainsi que d'ajouter une nouvelle catégorie pour les armes éprouvées.</p><p>La concentration de l'Armurier remplacera également la section de six armes de Banshee-44.</p><p>Les armes suivantes seront placées hors du butin potentiel. Elles ne seront pas disponibles dans les engrammes de l'Armurier ou la concentration mais seront parfois disponibles auprès de Xûr.</p><ul><li>Plan d'urgence</li><li>Action en justice II</li><li>Le Nombre</li><li>Souvenirs interdits</li><li>Correcteur des pléiades</li><li>Le Déicide</li><li>La Vision</li><li>Variable stochastique</li></ul><h4>Comment fonctionnera la rotation de ces armes ?</h4><p>Banshee-44 proposera deux fonderies à la fois (par exemple Suros et Häkke). Après chaque réinitialisation quotidienne, l'une de ces fonderies sera remplacée dans la rotation par une autre, ce qui permettra à chacune d'avoir son heure de gloire deux jours de suite. </p><p>Pour la Saison 23, l'emplacement de rotation va comme suit :</p><p>Jour 1</p><ul><li>Omolon</li></ul><ul><li>Suros</li></ul><p>Jour 2</p><ul><li>Suros</li><li>Häkke</li></ul><p>Jour 3</p><ul><li>Häkke</li><li>Veist</li></ul><p>Jour 4</p><ul><li>Veist</li><li>Omolon</li></ul><p>Après le quatrième jour, la rotation se répétera.</p><p>Ceci est sujet à modification au fur et à mesure que nous ajouterons des fonderies dans de futures mises à jour.</p><h4>Combien coûteront-elles ?</h4><p>Les coûts de concentration seront communs avec le coût des armes rituelles. </p><ul><li>3 engramme de l'Armurier</li><li>5 000 Lumen</li></ul><h4>Comment puis-je obtenir des engrammes de l'Armurier ?</h4><p>Nous savons que simplement monter la réputation de l'Armurier n'est pas la façon idéale d'obtenir des engrammes de l'Armurier. Nous l'avons pris en compte et avons décidé d'inclure davantage de façons d'obtenir des engrammes de l'Armurier !</p><ul><li>Monter la réputation de l'Armurier</li></ul><ul style=\"text-align: justify;\"><li>Secteurs oubliés terminés <ul><li>Normal (20 %)</li><li>Légende (solo et platine) (40%)</li><li>Maîtrise (solo et platine) (60%)</li></ul></li><li>Coffres libres (20 %) </li></ul><h2>Rapport du soutien aux joueurs</h2><p><em>Déchus de l'automne Non ? Je vais aller voir dehors.</em></p><img asset_uid=\"blt355cd313b88d8753\" src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt355cd313b88d8753/6345dc2e2d122610be62fb2c/D2_DPS_Gif.gif\" width=\"727\" height=\"140\" max-width=\"727\" style=\"max-width: 727px;width: 727;height: 140;\"/><p><a href=\"https://help.bungie.net/hc/en-us/articles/13265980348564-Destiny-2-Year-6-Known-Issues-and-Vital-Information\" target=\"_blank\">Liste des problèmes connus</a> | <a href=\"https://www.bungie.net/fr/Forums/Topics/?tg=Help&amp;tSort=3&amp;tType=0&amp;d=0&amp;lang=en\" target=\"_blank\">Forum d'aide</a> | <a href=\"https://twitter.com/BungieHelp\" target=\"_blank\">Aide Bungie sur Twitter/X</a></p><h4>CODES D'ERREUR</h4><p>Nous continuons à mener l'enquête au sujet des signalements de codes d'erreur dans Destiny 2. Restez à l'écoute de <a href=\"https://twitter.com/BungieHelp\" target=\"_blank\">@BungieHelp</a> pour des mises à jour supplémentaires et des continuez vos signalements d'erreurs sur notre <a href=\"https://www.bungie.net/fr/Forums/Topics/?tg=Help&amp;tSort=3&amp;tType=0&amp;d=0&amp;lang=en\" target=\"_blank\">forum d'aide</a>.</p><h4>EMBLÈME DU MODE DÉFI 48 HEURES DE LA CHUTE DE CROPTA</h4><p>Nous essayons de faire en sorte que les joueurs qui terminent le mode Défi de La Chute de Cropta pendant le mode Tournoi reçoivent bien le Triomphe Tous pour un et l'emblème associé. Des mises à jour supplémentaires seront fournies dès qu'elles seront disponibles.</p><p>Pour plus d'informations sur ce problème et sur les mesures prises pour le résoudre, veuillez consulter le rapport du soutien aux joueurs dans le <a href=\"https://www.bungie.net/7/fr/News/article/twid_09_14_2023\" target=\"_blank\">Cette semaine dans Destiny du 14 septembre.</a></p><h4>PROBLÈMES CONNUS</h4><p>Tandis que nous continuons d'enquêter sur divers problèmes connus, voici une liste des derniers problèmes qui ont été signalés sur notre <a href=\"https://www.bungie.net/fr/Forums/Topics/?tg=Help&amp;tSort=3&amp;tType=0&amp;d=0&amp;lang=en\" target=\"_blank\">forum d'aide</a> :</p><ul><li>Les joueurs peuvent parfois devenir bloqués lors de La voie des lames en progressant par différentes étapes de la quête simultanément.</li><li>Les bottes exotiques pour Titans La voie des pas enflammés et les ornements associés ne changent plus d'apparence quand l'attribut Arme solaire est actif.</li><li>Les armures exotiques pour Titans Givre-Z et Manteau de glace n'utilisent pas les bons temps de récupération.</li><li>Quand vous consultez les détails d'arme pour des objets stockés dans les coffres de joueurs, il se peut que l'icône d'attribut d'arme n'apparaisse plus.</li><li>Certains joueurs n'ayant pas entièrement fini les missions d'histoire de la Saison des Profondeurs peuvent se retrouver dans l'incapacité de terminer la mission d'histoire hebdomadaire en cours de la Saison de la Sorcière tant qu'ils n'ont pas terminé l'histoire de la saison précédente.</li><li>Les joueurs ayant déjà un compte et qui n'ont pas totalement terminé la quête d'introduction L'avènement des Gardiens avant le lancement d'Éclipse ne peuvent pas obtenir la quête Lumière apprenante.</li><li>Plusieurs pièces d'armure de bras peuvent créer des obstructions quand vous regardez dans le viseur sur le fusil à fusion exotique Dallage.</li></ul><p>Pour une liste complète des problèmes émergents de Destiny 2, les joueurs peuvent consulter notre <a href=\"https://help.bungie.net/hc/en-us/articles/13265980348564-Destiny-2-Year-6-Known-Issues-and-Vital-Information\" target=\"_blank\">article concernant les problèmes connus</a>. Les joueurs qui rencontrent d'autres problèmes peuvent nous les signaler via le <a href=\"https://www.bungie.net/fr/Forums/Topics/?tg=Help&amp;tSort=3&amp;tType=0&amp;d=0&amp;lang=en\" target=\"_blank\">forum d'aide</a>.</p><h2>Chef largueur</h2><img asset_uid=\"blt6173704a8449c46a\" src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt6173704a8449c46a/6345dc2d90be9f1178379cdd/TWAB_MovieOfTheWeek_2020_Animated.gif\"/><p><strong>Hippy : </strong>Quand Jared Gross et moi avons commencé Vétérans de l'Avant-garde chez Bungie, étant nous-mêmes des vétérans, il était important que nos équipes se sentent soutenues, particulièrement ceux qui pourraient avoir du mal avec la transition et le retour vers le monde civil. Jamais dans nos rêves les plus fous nous n'aurions pu anticiper de travailler avec l'incroyable équipe de Team Rubicon, une organisation bénévole qui lance de bonnes actions partout sur la planète. Lorsque la Bungie Foundation, Team Rubicon et Vétérans de l'Avant-garde ont combiné leurs forces, les incroyables interaction, emblème et pin's Chef largueur sont nés. Si vous avez manqué cette annonce, allez voir ça. Mais avant d'y aller, vous devriez vraiment consulter ce choix #Destiny2MOTW, parce qu'il montre la nouvelle interaction d'une façon carrément incroyable. Avec certaines feintes de Titans à la fin. Parce que pourquoi pas. </p><p><strong>Film de la semaine :</strong> Tout va bien, Chef largueur</p><iframe src=\"https://www.youtube.com/embed/I7r3dbqO0S0\" allowfullscreen=\"\" frameborder=\"0\" style=\"text-align: center;\"></iframe><h2>Qui l'a cassé ?</h2><img src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blta6fcbd4048abeba8/6514ab2bc9f9dc2e4e7bb211/TWAB_ArtistOfTheWeek_2020_Animated_V2.gif\"/><p><strong>Bruno :</strong> L'affaire des armes conçues, c'était quelque chose. Un défi à régler, mais l'une de ces choses que certains d'entre vous ont beaucoup appréciée et qui a engendré l'une des armes les plus fortes de l'histoire de Destiny, mais également d'excellents comics comme celui ci-dessous. Je suis également fan de Parks and Recreation, Polux !</p><p><strong>Art de la semaine :</strong> <a href=\"https://twitter.com/HyakunanaArts/status/1706349193944617205\" target=\"_blank\">The Crafting Mystery, by Polux (a.k.a. Hyakunana) via Twitter/X. (Click to read the whole comic!)</a></p><figure style = \"margin: auto; text-align: center;width: 406px;\"><img src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt92975d2bfec48f1f/6514996a8f0457750c12ad8c/F64quPWW8AAS_XW.jpg\" height=\"574\" style=\"margin: auto;text-align: center;width: 406px;\"/></figure><p style=\"text-align: left;\">__________________________________________________________________________________________________________________</p><p>Et voilà pour le CSDD de la semaine ! Nous avons officiellement atteint la période de l'année où les nuits sont plus longues que les journées, ici dans le Nord-Ouest sur la côte du Pacifique, alors le moment arrive de sortir les versions les plus douillettes de vous-même et de plonger dans vos activités favorites de Destiny 2 jusqu'au lever du soleil. Bon, peut-être pas aussi longtemps, n'oubliez pas de dormir et de profiter de l'herbe avant qu'elle ne soit couverte de neige. 😊 </p><p>Merci d'avoir passé du temps avec nous ! On se voit la semaine prochaine, même endroit, à peu près <a href=\"https://imgur.com/a/O2PF9Vr\" target=\"_blank\">à</a> la même heure.</p><p><strong>Gardez la gagne !</strong></p><p><strong>Sam</strong></p><p></p>",
      "ImagePath": "https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt8e058288a871d634/6514c0a0f864d5383a6387a7/FrontPageBanner_PC_1920x590.jpg",
      "OptionalMobileImagePath": "https://images.contentstack.io/v3/assets/blte410e3b15535c144/bltd1a17adde0ba07c7/6514c0a869060ae08efc2d7d/FrontPageBanner_Mobile_313x126.jpg"
    };

    final article = NewsArticle.fromJson(json);
    expect(article.uid, "blt1ba2f6362f2abedb");

    expect(article.title, "Cette semaine dans Destiny - 28/09/2023");
    expect(article.link, "/7/fr/News/Article/9-28-23-twid");
    expect(article.pubDate.toIso8601String(), "2023-09-28T18:00:00.000Z");
    expect(article.description, "Cette semaine dans Destiny, nous avons abordé la concentration de l'Armurier et eu un aperçu des mises à jour d'Échec et mat. ");
    expect(article.htmlContent, "<p>Joyeux CSDD, Gardiens ! Nous sommes de retour cette semaine avec de nouveaux aperçus et de nouvelles récompenses à obtenir ! L'histoire de la Saison de la Sorcière vous plaît ? Combien d'Autels avez-vous terminé jusqu'à maintenant ? Des avis sur Échec et mat ? En parlant d'Échec et mat, continuez à lire si vous voulez découvrir les changements à venir ! N'oubliez pas de nous contacter sur les réseaux sociaux, pour que nous puissions lire vos commentaires ! </p><p>Tout d'abord, voici un rappel du contenu du CSDD de la semaine dernière.</p><ul><li>La campagne « Chef largueur » débarque.</li><li>Création d'armes : que s'est-il passé ?!</li><li>Recul prédéfini : on vous explique son intérêt. </li><li>Des aventures vous attendent à la Chambre au trésor.</li><li>Il paraît que vous voulez un catalyseur de Chardon…</li><li>Le Cœur pâle vous attend. </li><li>L'équipe s'est un peu trop amusée avec les nouveaux Supers de La Forme Finale.</li><li>Un peu de lo-fi, ça aide toujours… surtout en compagnie d'Eris ! </li><li>Mise à jour Prime Gaming.</li><li>Balancez le petit Éliksni (vidéo humoristique).</li></ul><p>Sujets de la semaine : </p><ul><li>De nouvelles récompenses à obtenir.</li><li>Un aperçu de la mise à jour des armes Échec et mat de la semaine prochaine.</li><li>Concentration d'engrammes de l'<span>Armurier</span>.</li></ul><h2>Récompenses du Jugement et de Nuit noire</h2><p>Avez-vous déjà plongé dans la Nuit noire de cette semaine ? Si ce n'est pas le cas, il y a un nouvel arc de précision à obtenir ! En parlant de nouvelles armes, lorsque le Jugement reviendra ce week-end, un nouveau lance-grenades sera également disponible ! Regardons ce qui vient.</p><p></p><img src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt6d3665c06df03a64/6514c0eab0132a214d6fa359/TP_2023_S22_TWID_Bow_02.jpg\"/><p>Nouvel arc de Nuit noire : Pré-Astyanax IV</p><ul><li>Arc de précision : Solaire (Fonderie Cassoïde)</li><li>Colonne de gauche : Mouvement perpétuel, Cadence de l'archer, Flottement parfait, Tir pour butin, Action illuminée, Télémètre</li><li>Colonne de droite : Incandescent, Action collective, Échauffement réussi, Premier tir, Pointe explosive, Instrument de précision</li></ul><p></p><img src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt9f776a6cff664ec8/6514c0f4f864d5b4b36387ac/d2_TWID_20230928_GrenadeLauncher_16x9.jpg\"/><p>Nouveau lance-grenades du Jugement - Cataphractaire GL3</p><ul><li>Lance-grenades lourd adaptatif - Filobscur (Fonderie Omolon)</li><li>Colonne de gauche : Amplificateur d'impulsion, Envie assassine, Prêt pour le terrain, Saisie habile, Action illuminée, Holster de recharge auto, Démolisseur</li><li>Colonne de droite : Point de cascade, Réaction en chaîne, Lumière explosive, Petit, Fond de cour, Arme vorpale, Publicité mensongère</li></ul><h2>Mise à jour des armes Échec et mat </h2><p>Pour l'ajustement des armes Échec et mat, nous voulions nous assurer que nos options d'armes à munitions principales à moyenne portée disposaient d'espace pour manœuvrer, alors nous avons équilibré les autres types d'armes de façon pour conservative. La raison de cette décision est apparue dans les premiers tests de jeu, lorsqu'il est rapidement devenu apparent dans la sandbox que la réduction du temps de récupération pour les munitions spéciales et les compétences créaient un problème en jeu. Avec la plupart des contres qui ne voient plus suffisamment le jour, cela permettait des temps-par-frag (TPF) très rapides avec des armes à munitions principales qui étaient soient à longue portée soit à courte portée. Il devenait de plus en plus compliqué de lancer une offensive avec des pistolets-mitrailleurs et des pistolets puisque les joueurs savaient que les armes à munitions principales ne pouvaient pas tuer aussi rapidement et que les options de moyenne portée avaient du mal à se faire une place. De façon similaire, nous avons réduit les dégâts des armes principales à courte-portée pour les ajuster aux options à mi-distance, car les fusils d'éclaireur devenaient ingérables sans la menace des fusils de précision afin d'empêcher les joueurs de rester à très longue portée. </p><p>De plus, nous voulions éviter de faire des changements drastiques au TPF, par exemple avec des choses comme 140 revolvers prenant 4 coups pour tuer, alors nous avons limité l'évolution du TPF dans son ensemble. Après avoir vu Échec et mat en action pendant une semaine, nous avons vu qu'il y avait un écart substantiel entre les performances du revolver et le reste des arme à munitions principales du sandbox. Tout en conservant à l'esprit notre idée d'origine de permettre aux armes à moyenne portée de briller dans ce mode, nous créons un ensemble limité d'équilibrages conçu pour réduire l'écart sans l'accélérer le TPF des armes à munitions principales Par exemple, les pistolets-mitrailleurs et pistolets ne verront pas leur TPF redescendre en dessous des 0,80 s en raison du total de santé des joueurs, mais nous voulions leur fournir une marge d'erreur et encourager une certaine diversité dans les choix d'armes. Les armes comme les fusils à impulsion adaptatifs et à haute impulsion sont revenues à leur TPF optimal, tandis que la plupart des autres armes ont été légèrement modifiées. Bien que la plupart de nos modifications soient tournées sur l'amélioration de nouveaux archétypes d'arme à munitions principales, nous allons réduire les dégâts du revolver. Cela n'aura pas d'impact sur leur TPF optimal face à une résistance classique mais aura plutôt un impact sur la réduction de portée et la réduction du droit à l'erreur et de l'efficacité face à des cibles avec une résistance augmentée. Nous allons jouer avec ces modifications en jeu avec vous et nous continuerons les modifications dans le sandbox selon les besoins.</p><p></p><p>Voici les nouvelles modifications d'armes à venir dans Échec et mat la semaine prochaine :</p><p>Pénalité de dégâts augmentée pour : </p><ul><li>Rayon laser de Ruines du Diable : 10 % à 15 %</li><li>Lion de guerre : 0 % à 20 %</li><li>Arcs : 0 % à 10 %</li></ul><p>Pénalité de dégâts réduite pour : </p><ul><li>Pistolets : 10 % à 5 %</li><li>Pistolets-mitrailleurs : 5 % à 10 %</li><li>Fusils d'éclaireur : 10 % à 9 %</li></ul><p>Augmentation du bonus de dégâts pour : </p><ul><li>Fusils automatiques : 0 % à 2 %</li><li>Fusils automatiques : 0 % à 5 %</li></ul><p>Réduction du bonus de dégâts pour : </p><ul><li>Revolver : 10 % à 7 %</li></ul><p>Correction d'un problème qui permettait à Exégèse du Vex de bénéficier du bonus de dégâts des fusils à fusion à munitions spéciales.</p><h2>La concentration de l'<span>Armurier</span> arrive en ville</h2><p></p><img src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt24839b03102db6f2/6515b8bbd45f29eaa100bbb7/Foundry_Composite.jpg\" height=\"auto\"/><p>À partir de la Saison 23, Banshee-44 disposera d'options de concentration pour certaines armes de fonderie. La concentration de l'Armurier est conçue pour offrir aux joueurs qui cherchent à réaliser leur rêve d'obtenir des armes de fonderie plus anciennes tout en réduisant la quantité d'éléments légendaires.</p><h4>Quelles armes seront disponibles ?</h4><p>Les options de concentration disponibles auprès de Banshee-44 s'appliqueront aux armes des saisons 16 à 19, ce qui signifie que ces armes ont au moins <strong>quatre saisons d'ancienneté</strong> (environ 1 an). Ces armes ne seront <strong>plus disponibles dans les butins d'engrammes légendaires du jeu</strong> et seront désormais <strong>uniquement disponibles dans les engrammes de l'Armurier et avec la concentration.</strong></p><p>Saison 23 de l'Armurier et concentration :</p><p><strong>Suros</strong></p><ul><li>Cantate-57</li><li>Syncope-53</li><li>Fugue-55</li><li>Staccato-46</li><li>Pizzicato-22</li><li>Fioritura-59</li></ul><p><strong>Häkke</strong></p><ul><li>Palmyra-B</li><li>Persès-D</li><li>Ragnhild-D</li><li>Enyo-D</li><li>Boudica-C</li><li>Lodbrok-C</li></ul><p><strong>Veist</strong></p><ul><li>Krait</li><li>Redback-5si</li><li>Toile-entonnoir</li><li>Lunulata-4b</li><li>Taipan-4fr</li><li>Jararaca-3sr</li></ul><p><strong>Omolon</strong></p><ul><li>Snorri FF5</li><li>Typhon LG5</li><li>Ogma FI6</li><li>Gallu RR3</li><li>Ammit AR2</li><li>Aurvandil FR6</li></ul><p>Dans la Saison 24, nous avons prévu de mettre cette liste à jour avec des armes de la Saison 20 pour les fonderies existantes ainsi que d'ajouter une nouvelle catégorie pour les armes éprouvées.</p><p>La concentration de l'Armurier remplacera également la section de six armes de Banshee-44.</p><p>Les armes suivantes seront placées hors du butin potentiel. Elles ne seront pas disponibles dans les engrammes de l'Armurier ou la concentration mais seront parfois disponibles auprès de Xûr.</p><ul><li>Plan d'urgence</li><li>Action en justice II</li><li>Le Nombre</li><li>Souvenirs interdits</li><li>Correcteur des pléiades</li><li>Le Déicide</li><li>La Vision</li><li>Variable stochastique</li></ul><h4>Comment fonctionnera la rotation de ces armes ?</h4><p>Banshee-44 proposera deux fonderies à la fois (par exemple Suros et Häkke). Après chaque réinitialisation quotidienne, l'une de ces fonderies sera remplacée dans la rotation par une autre, ce qui permettra à chacune d'avoir son heure de gloire deux jours de suite. </p><p>Pour la Saison 23, l'emplacement de rotation va comme suit :</p><p>Jour 1</p><ul><li>Omolon</li></ul><ul><li>Suros</li></ul><p>Jour 2</p><ul><li>Suros</li><li>Häkke</li></ul><p>Jour 3</p><ul><li>Häkke</li><li>Veist</li></ul><p>Jour 4</p><ul><li>Veist</li><li>Omolon</li></ul><p>Après le quatrième jour, la rotation se répétera.</p><p>Ceci est sujet à modification au fur et à mesure que nous ajouterons des fonderies dans de futures mises à jour.</p><h4>Combien coûteront-elles ?</h4><p>Les coûts de concentration seront communs avec le coût des armes rituelles. </p><ul><li>3 engramme de l'Armurier</li><li>5 000 Lumen</li></ul><h4>Comment puis-je obtenir des engrammes de l'Armurier ?</h4><p>Nous savons que simplement monter la réputation de l'Armurier n'est pas la façon idéale d'obtenir des engrammes de l'Armurier. Nous l'avons pris en compte et avons décidé d'inclure davantage de façons d'obtenir des engrammes de l'Armurier !</p><ul><li>Monter la réputation de l'Armurier</li></ul><ul style=\"text-align: justify;\"><li>Secteurs oubliés terminés <ul><li>Normal (20 %)</li><li>Légende (solo et platine) (40%)</li><li>Maîtrise (solo et platine) (60%)</li></ul></li><li>Coffres libres (20 %) </li></ul><h2>Rapport du soutien aux joueurs</h2><p><em>Déchus de l'automne Non ? Je vais aller voir dehors.</em></p><img asset_uid=\"blt355cd313b88d8753\" src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt355cd313b88d8753/6345dc2e2d122610be62fb2c/D2_DPS_Gif.gif\" width=\"727\" height=\"140\" max-width=\"727\" style=\"max-width: 727px;width: 727;height: 140;\"/><p><a href=\"https://help.bungie.net/hc/en-us/articles/13265980348564-Destiny-2-Year-6-Known-Issues-and-Vital-Information\" target=\"_blank\">Liste des problèmes connus</a> | <a href=\"https://www.bungie.net/fr/Forums/Topics/?tg=Help&amp;tSort=3&amp;tType=0&amp;d=0&amp;lang=en\" target=\"_blank\">Forum d'aide</a> | <a href=\"https://twitter.com/BungieHelp\" target=\"_blank\">Aide Bungie sur Twitter/X</a></p><h4>CODES D'ERREUR</h4><p>Nous continuons à mener l'enquête au sujet des signalements de codes d'erreur dans Destiny 2. Restez à l'écoute de <a href=\"https://twitter.com/BungieHelp\" target=\"_blank\">@BungieHelp</a> pour des mises à jour supplémentaires et des continuez vos signalements d'erreurs sur notre <a href=\"https://www.bungie.net/fr/Forums/Topics/?tg=Help&amp;tSort=3&amp;tType=0&amp;d=0&amp;lang=en\" target=\"_blank\">forum d'aide</a>.</p><h4>EMBLÈME DU MODE DÉFI 48 HEURES DE LA CHUTE DE CROPTA</h4><p>Nous essayons de faire en sorte que les joueurs qui terminent le mode Défi de La Chute de Cropta pendant le mode Tournoi reçoivent bien le Triomphe Tous pour un et l'emblème associé. Des mises à jour supplémentaires seront fournies dès qu'elles seront disponibles.</p><p>Pour plus d'informations sur ce problème et sur les mesures prises pour le résoudre, veuillez consulter le rapport du soutien aux joueurs dans le <a href=\"https://www.bungie.net/7/fr/News/article/twid_09_14_2023\" target=\"_blank\">Cette semaine dans Destiny du 14 septembre.</a></p><h4>PROBLÈMES CONNUS</h4><p>Tandis que nous continuons d'enquêter sur divers problèmes connus, voici une liste des derniers problèmes qui ont été signalés sur notre <a href=\"https://www.bungie.net/fr/Forums/Topics/?tg=Help&amp;tSort=3&amp;tType=0&amp;d=0&amp;lang=en\" target=\"_blank\">forum d'aide</a> :</p><ul><li>Les joueurs peuvent parfois devenir bloqués lors de La voie des lames en progressant par différentes étapes de la quête simultanément.</li><li>Les bottes exotiques pour Titans La voie des pas enflammés et les ornements associés ne changent plus d'apparence quand l'attribut Arme solaire est actif.</li><li>Les armures exotiques pour Titans Givre-Z et Manteau de glace n'utilisent pas les bons temps de récupération.</li><li>Quand vous consultez les détails d'arme pour des objets stockés dans les coffres de joueurs, il se peut que l'icône d'attribut d'arme n'apparaisse plus.</li><li>Certains joueurs n'ayant pas entièrement fini les missions d'histoire de la Saison des Profondeurs peuvent se retrouver dans l'incapacité de terminer la mission d'histoire hebdomadaire en cours de la Saison de la Sorcière tant qu'ils n'ont pas terminé l'histoire de la saison précédente.</li><li>Les joueurs ayant déjà un compte et qui n'ont pas totalement terminé la quête d'introduction L'avènement des Gardiens avant le lancement d'Éclipse ne peuvent pas obtenir la quête Lumière apprenante.</li><li>Plusieurs pièces d'armure de bras peuvent créer des obstructions quand vous regardez dans le viseur sur le fusil à fusion exotique Dallage.</li></ul><p>Pour une liste complète des problèmes émergents de Destiny 2, les joueurs peuvent consulter notre <a href=\"https://help.bungie.net/hc/en-us/articles/13265980348564-Destiny-2-Year-6-Known-Issues-and-Vital-Information\" target=\"_blank\">article concernant les problèmes connus</a>. Les joueurs qui rencontrent d'autres problèmes peuvent nous les signaler via le <a href=\"https://www.bungie.net/fr/Forums/Topics/?tg=Help&amp;tSort=3&amp;tType=0&amp;d=0&amp;lang=en\" target=\"_blank\">forum d'aide</a>.</p><h2>Chef largueur</h2><img asset_uid=\"blt6173704a8449c46a\" src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt6173704a8449c46a/6345dc2d90be9f1178379cdd/TWAB_MovieOfTheWeek_2020_Animated.gif\"/><p><strong>Hippy : </strong>Quand Jared Gross et moi avons commencé Vétérans de l'Avant-garde chez Bungie, étant nous-mêmes des vétérans, il était important que nos équipes se sentent soutenues, particulièrement ceux qui pourraient avoir du mal avec la transition et le retour vers le monde civil. Jamais dans nos rêves les plus fous nous n'aurions pu anticiper de travailler avec l'incroyable équipe de Team Rubicon, une organisation bénévole qui lance de bonnes actions partout sur la planète. Lorsque la Bungie Foundation, Team Rubicon et Vétérans de l'Avant-garde ont combiné leurs forces, les incroyables interaction, emblème et pin's Chef largueur sont nés. Si vous avez manqué cette annonce, allez voir ça. Mais avant d'y aller, vous devriez vraiment consulter ce choix #Destiny2MOTW, parce qu'il montre la nouvelle interaction d'une façon carrément incroyable. Avec certaines feintes de Titans à la fin. Parce que pourquoi pas. </p><p><strong>Film de la semaine :</strong> Tout va bien, Chef largueur</p><iframe src=\"https://www.youtube.com/embed/I7r3dbqO0S0\" allowfullscreen=\"\" frameborder=\"0\" style=\"text-align: center;\"></iframe><h2>Qui l'a cassé ?</h2><img src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blta6fcbd4048abeba8/6514ab2bc9f9dc2e4e7bb211/TWAB_ArtistOfTheWeek_2020_Animated_V2.gif\"/><p><strong>Bruno :</strong> L'affaire des armes conçues, c'était quelque chose. Un défi à régler, mais l'une de ces choses que certains d'entre vous ont beaucoup appréciée et qui a engendré l'une des armes les plus fortes de l'histoire de Destiny, mais également d'excellents comics comme celui ci-dessous. Je suis également fan de Parks and Recreation, Polux !</p><p><strong>Art de la semaine :</strong> <a href=\"https://twitter.com/HyakunanaArts/status/1706349193944617205\" target=\"_blank\">The Crafting Mystery, by Polux (a.k.a. Hyakunana) via Twitter/X. (Click to read the whole comic!)</a></p><figure style = \"margin: auto; text-align: center;width: 406px;\"><img src=\"https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt92975d2bfec48f1f/6514996a8f0457750c12ad8c/F64quPWW8AAS_XW.jpg\" height=\"574\" style=\"margin: auto;text-align: center;width: 406px;\"/></figure><p style=\"text-align: left;\">__________________________________________________________________________________________________________________</p><p>Et voilà pour le CSDD de la semaine ! Nous avons officiellement atteint la période de l'année où les nuits sont plus longues que les journées, ici dans le Nord-Ouest sur la côte du Pacifique, alors le moment arrive de sortir les versions les plus douillettes de vous-même et de plonger dans vos activités favorites de Destiny 2 jusqu'au lever du soleil. Bon, peut-être pas aussi longtemps, n'oubliez pas de dormir et de profiter de l'herbe avant qu'elle ne soit couverte de neige. 😊 </p><p>Merci d'avoir passé du temps avec nous ! On se voit la semaine prochaine, même endroit, à peu près <a href=\"https://imgur.com/a/O2PF9Vr\" target=\"_blank\">à</a> la même heure.</p><p><strong>Gardez la gagne !</strong></p><p><strong>Sam</strong></p><p></p>");

    expect(article.bannerImagePath, "https://images.contentstack.io/v3/assets/blte410e3b15535c144/blt8e058288a871d634/6514c0a0f864d5383a6387a7/FrontPageBanner_PC_1920x590.jpg");
    expect(article.optionalMobileAsset, "https://images.contentstack.io/v3/assets/blte410e3b15535c144/bltd1a17adde0ba07c7/6514c0a869060ae08efc2d7d/FrontPageBanner_Mobile_313x126.jpg");
  });
}
