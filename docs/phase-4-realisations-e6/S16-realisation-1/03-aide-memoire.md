# Aide-mémoire – Mener une réalisation

*BTS SIO SISR 2e année – Bloc 2 – S16*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

## Cycle

Analyser → concevoir → préparer les tests → maquetter → installer → recetter → documenter → exploiter.

## Arborescence du dossier

<figure class="graphe diagramme"><svg viewBox="0 0 514 246" style="max-width:514px" role="img" aria-label="Arborescence du dossier de réalisation R1" xmlns="http://www.w3.org/2000/svg">
<line x1="26" y1="34" x2="26" y2="55" class="dg-line"/>
<line x1="26" y1="55" x2="50" y2="55" class="dg-line"/>
<line x1="26" y1="34" x2="26" y2="89" class="dg-line"/>
<line x1="26" y1="89" x2="50" y2="89" class="dg-line"/>
<line x1="26" y1="34" x2="26" y2="123" class="dg-line"/>
<line x1="26" y1="123" x2="50" y2="123" class="dg-line"/>
<line x1="26" y1="34" x2="26" y2="157" class="dg-line"/>
<line x1="26" y1="157" x2="50" y2="157" class="dg-line"/>
<line x1="26" y1="34" x2="26" y2="191" class="dg-line"/>
<line x1="26" y1="191" x2="50" y2="191" class="dg-line"/>
<line x1="26" y1="34" x2="26" y2="225" class="dg-line"/>
<line x1="26" y1="225" x2="50" y2="225" class="dg-line"/>
<rect x="12" y="8" width="50" height="26" rx="6" class="dg-dark"/>
<text x="37.0" y="26" text-anchor="middle" class="dg-w">R1/</text>
<rect x="50" y="42" width="85" height="26" rx="6" class="dg-soft"/>
<text x="92.7" y="60" text-anchor="middle" class="dg-s">README.md</text>
<rect x="50" y="76" width="66" height="26" rx="6" class="dg-box"/>
<text x="83.0" y="94" text-anchor="middle" class="dg-t">docs/</text>
<text x="126.0" y="94" text-anchor="start" class="dg-i">cahier des charges, choix, documentation, journal, incidents</text>
<rect x="50" y="110" width="90" height="26" rx="6" class="dg-box"/>
<text x="95.0" y="128" text-anchor="middle" class="dg-t">configs/</text>
<text x="150.0" y="128" text-anchor="start" class="dg-i">configurations sans secret</text>
<rect x="50" y="144" width="90" height="26" rx="6" class="dg-box"/>
<text x="95.0" y="162" text-anchor="middle" class="dg-t">scripts/</text>
<text x="150.0" y="162" text-anchor="start" class="dg-i">installation et exploitation</text>
<rect x="50" y="178" width="90" height="26" rx="6" class="dg-box"/>
<text x="95.0" y="196" text-anchor="middle" class="dg-t">preuves/</text>
<text x="150.0" y="196" text-anchor="start" class="dg-i">captures, sorties, journaux</text>
<rect x="50" y="212" width="74" height="26" rx="6" class="dg-box"/>
<text x="87.0" y="230" text-anchor="middle" class="dg-t">tests/</text>
<text x="134.0" y="230" text-anchor="start" class="dg-i">plan de recette, rapport de tests</text>
</svg>
<figcaption>Un dépôt par réalisation, avec documentation, configurations sans secret, scripts, preuves et tests.</figcaption>
</figure>

## Une preuve

Horodatée · lisible · rattachée à une exigence. Prendre la capture **juste après** l'action.

## Dossier de choix

Au moins **deux options** · réponse au besoin · coût · délai · compétences · maintenabilité · éthique et environnement · risques · conclusion argumentée.

## Documents possibles à l'épreuve

Documentation technique · documentation utilisateur · rapport de tests · rapport d'incident.

## Kit de reprise (60 min le jour J)

Instantanés « nominal » · dépôt Git · fichier d'accès · aide-mémoire de commandes · schéma et adressage.

## Fiche descriptive

Recto : identification, compétences, conditions, ressources, accès. Verso : contexte, solution et choix, mise en œuvre, tests, exploitation, bilan.

## Réflexes

- Tests préparés **avant** l'installation.
- Un problème = un mini rapport d'incident, pas un oubli.
- Pas de secret dans le dépôt.
- Réalisation plus petite mais **prouvée** > grande à moitié testée.
