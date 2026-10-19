# Cours – Cahier des charges, contrat de prestation et responsabilité

*BTS SIO SISR 2e année – Bloc 2 – S02*

> Un mot ou un sigle inconnu ? Passe la souris dessus, ou ouvre le [glossaire](../../ressources/glossaire.md).

> [!NOTE]
> Les notions juridiques de ce cours sont **introduites** pour ce que l'administrateur doit en connaître. Elles sont approfondies en **culture économique, juridique et managériale** (CEJM). En cas de doute, c'est le cours de CEJM et le texte de loi qui font foi.

Un client ne demande pas « un VLAN et un serveur DHCP » : il décrit un **besoin**. Ta première tâche d'administrateur est de le comprendre, de le traduire en exigences vérifiables, puis de savoir **ce que tu promets** et **de quoi tu réponds**. C'est aussi ce que l'épreuve E6 te demande dans l'**expression des besoins** remise pendant la préparation.

---

## 1. De l'expression des besoins au cahier des charges

| Document | Qui l'écrit | Contenu |
|---|---|---|
| **Expression des besoins** | Le client | Ce qu'il veut obtenir, dans ses mots : contexte, problème, attentes |
| **Cahier des charges** | Le client, ou le prestataire avec lui | Les exigences **précises** et **vérifiables**, le périmètre, les contraintes, les critères de réception |
| **Proposition technique** | Le prestataire | La solution retenue, l'architecture, le planning, le prix |

### Ce que contient un cahier des charges

| Rubrique | Question à laquelle elle répond | Exemple |
|---|---|---|
| **Contexte** | Qui est le client, que fait-il, quelle est l'existant ? | Cabinet de 12 personnes, deux sites, un seul serveur vieillissant |
| **Périmètre** | Qu'est-ce qui est **inclus**, et **exclu** ? | Inclus : serveur de fichiers et sauvegarde. Exclu : messagerie |
| **Exigences fonctionnelles** | Que doit faire le système pour les utilisateurs ? | Chaque service a un dossier partagé auquel seul ce service accède |
| **Exigences techniques** | Avec quelles caractéristiques ? | Authentification centralisée, sauvegarde quotidienne |
| **Contraintes** | Qu'est-ce qui limite les choix ? | Budget, délai, logiciels existants, réglementation (données personnelles) |
| **Critères de réception (recette)** | Comment vérifiera-t-on que c'est conforme ? | Test de restauration réussi devant le client |

### Une bonne exigence est vérifiable

| Exigence vague | Exigence exploitable |
|---|---|
| « Le réseau doit être rapide » | « Le temps de réponse entre un poste et le serveur reste inférieur à 20 ms en heures ouvrées » |
| « Le serveur doit être disponible » | « Le service de fichiers est disponible 99,9 % du temps en heures ouvrées, mesuré par la supervision » |
| « Les données doivent être sauvegardées » | « Une sauvegarde quotidienne, restauration complète possible en moins de 4 heures, testée chaque trimestre » |
| « L'accès doit être sécurisé » | « Authentification par compte nominatif, droits par groupe, accès distant uniquement par VPN » |

**Test flash.** Pourquoi « le système doit être sécurisé » est-il une mauvaise exigence ?

<details markdown="1">
<summary>Voir la réponse</summary>

Parce qu'on ne peut **pas la vérifier** : personne ne sait à partir de quand le système est « sécurisé ». Il faut la traduire en mesures **observables** (qui accède à quoi, comment, avec quelles preuves).

</details>

### Méthode pour exploiter une expression des besoins

1. **Reformuler** le besoin en une ou deux phrases ;
2. **Lister** les exigences et les **classer** (fonctionnelles, techniques, contraintes) ;
3. **Repérer** ce qui est **flou, manquant ou contradictoire**, et **formuler des questions** au client ;
4. **Poser des hypothèses** explicites pour continuer malgré les inconnues ;
5. **Proposer** une solution et des **critères de recette**.

---

## 2. Les enjeux juridiques du cahier des charges

- Annexé au contrat, le cahier des charges devient une **référence contractuelle** : ce qui y est écrit engage le prestataire, ce qui n'y figure pas peut être contesté.
- Un cahier des charges **imprécis** est la première cause de litige : chacun comprend autre chose, et la réception se discute.
- Le prestataire informatique est un **professionnel** : il a un devoir de **conseil** et d'**information** envers un client qui, lui, ne maîtrise pas la technique. Il doit signaler un besoin mal exprimé, un choix risqué ou un budget insuffisant.
- Le client a de son côté un devoir de **collaboration** : fournir les informations et les accès nécessaires.

> [!NOTE]
> **Réflexe d'administrateur.** Ce que le client t'a dit à l'oral, mets-le **par écrit** (compte rendu, courriel) et fais-le valider.

---

## 3. Le contrat de prestation de services informatiques

Le contrat suit trois moments : sa **formation**, son **exécution**, son **inexécution**.

### Formation

Pour être valable, un contrat suppose le **consentement** des parties, leur **capacité** à contracter et un **contenu licite et certain** (Code civil, article 1128). Un consentement obtenu par erreur, dol (tromperie) ou violence peut mener à l'**annulation**.

### Exécution : les clauses à repérer

| Clause | Ce qu'elle prévoit | Ce que l'administrateur doit en retenir |
|---|---|---|
| **Objet et périmètre** | Les prestations dues | Ce qui est hors périmètre n'est pas dû |
| **Durée, délais** | Début, fin, dates de livraison | Un retard peut engager la responsabilité |
| **Niveau de service (SLA)** | Disponibilité, délai de rétablissement, horaires | Ce sont des engagements **mesurables** |
| **Prix et paiement** | Forfait, régie, abonnement | Les modifications de périmètre ont un coût |
| **Confidentialité** | Interdiction de divulguer les informations du client | S'impose aussi à toi, même après la fin du contrat |
| **Propriété** | Qui possède les livrables, les développements, les données | Les données restent au client |
| **Responsabilité** | Limites ou plafonds de responsabilité | Elle peut être limitée, pas supprimée en cas de faute lourde |
| **Réversibilité** | Restitution des données et de la documentation en fin de contrat | À prévoir dès le début |
| **Résiliation** | Conditions de rupture | Préavis, motifs |

Deux niveaux d'engagement :

- **Obligation de moyens** : le prestataire s'engage à tout mettre en œuvre, sans garantir le résultat (assistance, maintenance).
- **Obligation de résultat** : le prestataire garantit un résultat précis (livrer un serveur conforme au cahier des charges, une sauvegarde restaurable). Il ne s'en exonère qu'en prouvant une cause étrangère.

### Inexécution

Quand une partie n'exécute pas ses obligations, l'autre peut, selon les cas (Code civil, article 1217) : **refuser** d'exécuter la sienne, demander l'**exécution forcée**, obtenir une **réduction du prix**, **résoudre** le contrat ou demander des **dommages et intérêts**. Une **mise en demeure** écrite précède en général.

**Test flash.** Une clause garantit « une restauration complète en moins de 4 heures ». Obligation de moyens ou de résultat ?

<details markdown="1">
<summary>Voir la réponse</summary>

**De résultat** : le critère est précis et mesurable. Il faut donc **tester** que la restauration respecte bien ce délai avant de s'engager.

</details>

---

## 4. La responsabilité de l'administrateur système et réseau

Tu disposes de **droits étendus** : accès aux fichiers, aux courriels, aux journaux, aux sauvegardes. Ce pouvoir s'accompagne de responsabilités.

| Responsabilité | Quand | Exemples |
|---|---|---|
| **Civile contractuelle** | Une faute dans l'exécution d'un contrat cause un dommage au client | Une sauvegarde jamais testée est inutilisable le jour d'une panne |
| **Civile délictuelle** | Un dommage causé à un tiers, hors contrat | Une panne de ton service empêche un partenaire de travailler |
| **Pénale** | Une infraction est commise | Accès ou maintien frauduleux dans un système, atteinte aux données (Code pénal, articles 323-1 et suivants), violation du secret des correspondances |
| **Disciplinaire** | Un manquement aux règles de l'employeur | Non-respect de la charte informatique |

À retenir :

- Un **salarié** agissant dans le cadre de sa mission voit sa responsabilité civile **limitée** (c'est en principe l'employeur qui répond de ses salariés) ; la **responsabilité pénale** reste **personnelle**.
- Un **ordre de ta hiérarchie** ne te dégage pas d'une infraction : consulter les messages privés d'un collègue sans cadre légal reste un acte répréhensible.
- Le **secret professionnel et la confidentialité** s'imposent à toi pour tout ce que tu vois en administrant.
- Tu dois **tracer** tes actions (journaux, procédures, tickets) : c'est ta protection.
- La **charte informatique** de l'entreprise fixe les règles d'usage et d'administration ; elle t'est opposable comme aux autres salariés.

> [!WARNING]
> En cas de demande douteuse (« donne-moi les mails de X »), **ne fais rien dans l'urgence** : demande l'accord écrit de la direction ou du délégué à la protection des données, et informe le responsable sécurité.

**Test flash.** Ton responsable te demande de lire discrètement la messagerie d'un collègue. Que fais-tu ?

<details markdown="1">
<summary>Voir la réponse</summary>

Tu **refuses d'agir seul**, tu demandes une demande **écrite**, et tu fais vérifier le **cadre légal** (charte, droit au respect de la vie privée sur le lieu de travail, protection des données) par la direction ou le référent juridique. L'ordre oral d'un supérieur ne te protège pas.

</details>

---

## Ce que tu dois retenir de la séance

- Une **exigence** utile est **vérifiable**.
- Le **cahier des charges** est un document **contractuel** : l'écrit protège les deux parties.
- Lis un contrat avec trois questions : **qu'est-ce que je dois**, **jusqu'où je réponds**, **comment on le mesure**.
- L'administrateur a des droits étendus : **traçabilité, confidentialité, accord écrit**.
