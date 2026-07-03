# Differentiële genexpressie in synovium bij reumatoïde artritis toont dominante immuun- en ontstekingsprocessen
# Inleiding

Reumatoïde artritis (RA) is een chronische auto-immuunziekte die wordt gekenmerkt door ontsteking van het synovium en progressieve gewrichtsschade. De aandoening komt wereldwijd voor bij ongeveer 0,5% van de bevolking en treft vrouwen vaker dan mannen. Zowel genetische als omgevingsfactoren dragen bij aan het ontstaan van RA (Almutairi et al., 2020; Romão & Fonseca, 2021).

Verschillende signaalroutes spelen een belangrijke rol in de pathogenese van RA, waaronder de JAK-STAT-route. Activatie van deze route door cytokinen zoals IL-6 en interferonen leidt tot verhoogde expressie van ontstekingsgenen (Ciobanu et al., 2020). Het doel van dit onderzoek was om met behulp van RNA-sequencing verschillen in genexpressie en biologische pathways tussen RA-patiënten en gezonde controles te identificeren.

# Beheren

* `Bronnen` - Hier staat een Word-document met de verwijzingen naar alle gebruikte bronnen.
* `Grafieken`- Hier staan alle gemaakte grafieken.
* `R_script`- Hier staan de gebruikte R scripten.
* `Ruwe_Data`- Hier staan de ruwe data en de BAM bestanden die gemaakt zijn.

# Methode
Voor de analyse is er gebruikt gemaakt van RNA-sequencingdata afkomstig van synoviumbiopten. De data is afkomstig van vier gezonde personen en vier patiënten met reumatoïde artritis (RA). De verkregen ruwe sequencingdata werden aangeleverd als [FastQ bestanden](Ruwe_Data\Data_raw-RA). Met behulp van het Rsubread pakket (versie 2.24.0) zijn de reads uitgelijnd tegen het humane referentie genoom [GRCh38.p14](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/). Voor elk bestand werd vervolgens een BAM bestand gemaakt. Deze bestanden worden gesorteerd en geïdexeerd.

Met behulp van de functie FeatureCounts werd het aantal reads per gen bepaald op basis van de beschikbare GTF-annotatie. De verkregen data werden samengevoegd tot een countmatrix om vervolgens gekoppeld te worden aan de bijbehorende metadata van de monsters. Om verschillen in genexpressie tussen beide groepen te onderzoeken, is een differentiële genexpressieanalyse uitgevoerd met het pakket DESeq2 (versie 1.50.2). Hierbij werd de genexpressie van genen in de RA-groep vergeleken met de controlegroepen. Genen met een aangepaste p-waarde < 0,05 worden beschouwd als significant verschillend in expressie.

Voor de visualisatie van de resultaten is een volcano plot gemaakt met behulp van het EnhancedVolcano pakket (versie 1.28.2). Verder is er een Gene Ontology (GO) analyse en een KEGG-pathway analyse uitgevoerd op de significante genen om inzicht te krijgen in de signaalroutes en biologische processen die betrokken zijn bij reumatoïde artritis (RA).

De gebruikte [scripts](R_script), [ruwe data](Ruwe_Data) en tussenbestanden zijn opgenomen in de githubpagina.

<img width="1920" height="1080" alt="Flowchart" src="https://github.com/user-attachments/assets/7998f721-05a1-4560-8429-6b51962a7acb" />

*figuur 1. Stroomdiagram van de RNA-seq analyse, waarin stappen van ruwe data tot significante genen en interpretatie (GO en KEGG) worden weergegeven.*

# Resultaten
## Differentiële genexpressie toont sterke transcriptomische veranderingen in RA
De differentiële genexpressieanalyse identificeerde 5119 significant verschillend geëxprimeerde genen, waarvan 2525 opgereguleerd en 2594 neerwaarts gereguleerd. Meerdere immunoglobulinegenen (IGHV3-53, IGKV1-39, IGKV3D-15 en IGHV6-1) behoorden tot de sterkst opgereguleerde genen, wat wijst op verhoogde B-celactiviteit (Mauri & Ehrenstein, 2007).

<img width="400" height="500" alt="Volcanoplot_Casus(RA)" src="https://github.com/user-attachments/assets/41db9e32-b598-45cc-82f7-49a47df82ecd" />

*Figuur 2. Volcano plot van differentieel geëxprimeerde genen tussen RA-patiënten en gezonde controles. De x-as geeft de log₂ fold change weer en de y-as de -log10 aangepaste p-waarde. In totaal werden 5119 significant differentieel geëxprimeerde genen gevonden (padj < 0,05), waarvan 2525 opgereguleerd en 2594 neerwaarts gereguleerd. Rode punten vertegenwoordigen significante genen.*


##  Immuunrespons en lymfocytactivatie zijn verhoogd in RA synovium
De GO-analyse liet een verhoging zien van processen betrokken bij de adaptieve immuunrespons, lymfocytactivatie en immuunreceptorsignalering. Deze bevindingen wijzen op verhoogde activiteit van zowel T- als B-cellen binnen het RA-synovium.

<img width="400" height="350" alt="GO_plot" src="https://github.com/user-attachments/assets/367c1b9c-4a4b-4077-9530-7fb51afd0e56" />

*figuur 3. GO annalyse. Significante biologische processen worden weergegeven op basis van differentieel tot expressie komende genen. De GeneRatio (x-as) geeft de verhouding van betrokken genen weer, terwijl de puntgrootte het absolute aantal genen per categorie representeert. De kleurenschaal geeft de aangepaste p-waarde (padj) weer, waarbij lagere waarden hogere significantie aangeven.*

## Ontstekingsgerelateerde signaalroutes zijn verhoogd in RA
De KEGG-analyse identificeerde meerdere ontstekingsgerelateerde pathways, waaronder de MAPK- en PI3K-Akt-signaalroutes. Deze pathways spelen een belangrijke rol bij cytokinesignalering, immuunactivatie en ontsteking. Activatie van deze routes draagt bij aan het ontstaan en onderhouden van chronische ontstekingsreacties bij RA (Garcia et al., 2020; Ding et al., 2024).

<img width="400" height="350" alt="kegg_pathway_plot" src="https://github.com/user-attachments/assets/a0b3eac1-d284-4eb8-8797-da3767832458" />

*figuur 4 KEGG pathway. De plot toont KEGG-pathways op basis van differentieel tot expressie komende genen. De x-as geeft het percentage genen weer dat betrokken is bij elke pathway, terwijl de grootte van de punten het aantal genen (count) representeert. De kleur geeft de aangepaste p-waarde (padj) weer, waarbij lagere waarden duiden op hogere significantie.*

## Cytokinesignalering speelt een centrale rol binnen de RA pathway
Figuur 5 laat zien dat meerdere proinflammatoire cytokinen, waaronder TNFα, IL1β, IL6 en IFNγ, verhoogd tot expressie kwamen. Daarnaast werden diverse chemokinen, waaronder CCL2, CCL13, CCL20, CXCL1 en IL8, opgereguleerd. Deze veranderingen wijzen op een verhoogde activatie van ontstekingsroutes en rekrutering van immuuncellen naar het synovium.

<img width="1492" height="859" alt="pathview casus RA" src="https://github.com/user-attachments/assets/649c22d2-77cb-497f-b6af-0f1a4079d661" />

*Figuur 5. KEGG Pathview analyse van de rheumatoid arthritissignaalroute. Rood gekleurde genen zijn opgereguleerd en groen gekleurde genen zijn neerwaarts gereguleerd ten opzichte van de controlegroep. De resultaten tonen een verhoogde expressie van genen betrokken bij immuunactivatie, cytokinesignalering, leukocytenmigratie en gewrichtsontsteking, passend bij de pathofysiologie van reumatoïde artritis.*

### Belangrijkste opgereguleerde genen binnen de RA-pathway

| Gen | Biologische functie |
|------|------|
| TNF | Pro-inflammatoir cytokine betrokken bij gewrichtsontsteking |
| IL6 | Stimuleert ontstekingsreacties en immuunactivatie |
| IL1B | Bevordert ontsteking en kraakbeenafbraak |
| CCL20 | Rekruteert immuuncellen naar het synovium |
| CXCL8 | Trekt neutrofielen aan naar ontstekingshaarden |

*Tabel 1. laat zien dat meerdere sterk opgereguleerde genen betrokken zijn bij cytokinesignalering en immuuncelrekrutering. Vooral TNF, IL6 en IL1B zijn bekende ontstekingsmediatoren die een belangrijke rol spelen in de pathogenese van reumatoïde artritis. De verhoogde expressie van chemokinen zoals CCL20 en CXCL8 wijst daarnaast op verhoogde migratie van immuuncellen naar het ontstoken synovium.*

# Conclusie
De RNA-sequencinganalyse identificeerde 5119 significant verschillende geëxprimeerde genen tussen RA-patiënten en gezonde controles. GO-, KEGG- en Pathview-analyses lieten zien dat vooral immuunactivatie, cytokinesignalering en ontstekingsprocessen verhoogd zijn. Verhoogde expressie van genen zoals TNF, IL6, IL1B, CCL20 en CXCL8 ondersteunt de centrale rol van immuun- en ontstekingsroutes in de pathogenese van reumatoïde artritis.

## Samengevat
Dit onderzoek laat zien dat reumatoïde artritis wordt gekenmerkt door sterke transcriptomische veranderingen die voornamelijk betrekking hebben op immuun- en ontstekingsprocessen. De geïdentificeerde genen en pathways vormen potentiële aanknopingspunten voor verder onderzoek naar ziekteprocessen en toekomstige therapeutische strategieën. 

# Aanbevelingen
Een beperking van dit onderzoek is de kleine steekproefomvang van vier patiënten en vier controles, waardoor de resultaten met voorzichtigheid moeten worden geïnterpreteerd. Toekomstig onderzoek met een groter aantal patiëntenmonsters kan de betrouwbaarheid van de gevonden genen en pathways verhogen. Daarnaast kan een qPCR worden uitgevoerd om de verhoogde expressie van belangrijke genen, zoals TNF, IL6 en IL1B, onafhankelijk te bevestigen.
