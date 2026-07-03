# Differentiële genexpressie in synovium bij reumatoïde artritis toont dominante immuun- en ontstekingsprocessen
# Inleiding
Reumatoïde artritis (RA) is een chronische auto-immuunziekte waarbij het immuunsysteem gezonde gewrichten aanvalt. Hierdoor ontstaan ontstekingen in onder andere de handen, polsen en knieën, wat kan leiden tot stijfheid, pijn en blijvende gewrichtsklachten. Naast gewrichtsklachten kan RA ook andere organen aantasten, zoals de longen en het hart. De ziekte heeft daardoor een grote invloed op de kwaliteit van leven van patiënten. Wereldwijd komt RA voor bij ongeveer 0,5% van de bevolking. De aandoening wordt vaker gezien bij vrouwen dan bij mannen (Almutairi et al., 2020).

De exacte oorzaak van RA is nog niet volledig bekend, maar onderzoek laat zien dat zowel genetische als omgevingsfactoren een belangrijke rol spelen. Risicofactoren zoals roken, overgewicht en bepaalde infecties kunnen bijdragen aan het ontstaan van de ziekte. Daarnaast speelt het immuunsysteem een centrale rol bij de ontwikkeling van chronische ontstekingen in synoviale weefsels van gewrichten (Romão & Fonseca, 2021).

Bij RA spelen verschillende intracellulaire signaalroutes een belangrijke rol in het ontstaan en onderhouden van ontstekingen. Een van deze signaalroutes is de JAK-STAT signaalroute. Deze pathway wordt geactiveerd door cytokinen zoals interleukine 6 (IL-6) en interferonen. Activatie van JAK-STAT zorgt ervoor dat ontstekingsgenen in de celkern worden geactiveerd, waardoor chronische ontstekingen in de gewrichten ontstaan (Ciobanu et al., 2020). Het doel van dit onderzoek is om met behulp van RNA-sequencingdata, geanalyseerd in R, te bepalen welke genen en biologische pathways significant verschillen in expressie tussen synoviumbiopten van RA patiënten en gezonde controles.

# Beheren
* `Bronnen` - Hier staat een Word-document met de verwijzingen naar alle gebruikte bronnen.
* `Grafieken`- Hier staan alle gemaakt grafieken.
* `R_script`- Hier staan de gebruikte R scripten.
* `Ruwe_Data`- Hier staan de ruwe data en de BAM bestanden die gemaakt zijn.

# Methode
Voor de analyse is er gebruikt gemaakt van RNA-seqeucingdata afkomstig van synoviumbiopten. De data is afkomstig van vier gezonde personen en vier patiënten met reumatoïde artritis (RA). De verkregen ruwe sequencingdata werden aangeleverd als [FastQ bestanden](Ruwe_Data\Data_raw-RA). Met behulp van het Rsubread pakket (versie 2.24.0) zijn de reads uitgelijnd tegen het humane referentie genoom [GRCh38.p14](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/). Voor elk bestand werd vervolgens een BAM bestand gemaakt. Deze bestanden worden gesorteerd en geïdexeerd.

Met behulp van de functie FeatureCounts werd het aantal reads per gen bepaald op basis van de beschikbare GTF-annotatie. De verkregen data werden samengevoegd tot een countmatrix om vervolgens gekoppeld te worden aan de bijbehorende metadata van de monsters. Om verschillen in genexpressie tussen beide groepen te onderzoeken, is een differentiële genexpressieanalyse uitgevoerd met het pakket DESeq2 (versie 1.50.2). Hierbij werd de genexpressie van genen in de RA-groep vergeleken met de controlegroepen. Genen met een aangepaste p-waarde < 0,05 worden beschouwd als significant verschillend in expressie.

Voor de visualisatie van de resultaten is een volcano plot gemaakt met behulp van het EnhancedVolcano pakket (versie 1.28.2). Verder is er een Gene Ontology (GO) analyse en een KEGG-pathway analyse uitgevoerd op de significante genen om inzicht te krijgen in de signaalroutes en biologische processen die betrokken zijn bij reumatoïde artritis (RA).

De gebruikte [scrips](R_script), [ruwe data](Ruwe_Data) en tussenbestanden zijn opgenomen in de githubpagina.

<img width="1920" height="1080" alt="Flowchart" src="https://github.com/user-attachments/assets/7998f721-05a1-4560-8429-6b51962a7acb" />

*figuur 1. Stroomdiagram van de RNA-seq analyse, waarin stappen van ruwe data tot significante genen en interpretatie (GO en KEGG) worden weergegeven.*

# Resultaten
## Differentiële genexpressie toont sterke transcriptomische veranderingen in RA
De RNA-sequencinganalyse laat zien dat er duidelijke verschillen in genexpressie bestaan tussen RA-patiënten en de gezonde controlegroep. De volcano plot (figuur 2) toont aan dat veel genen significant veranderd zijn, zowel upregulated als downregulated, waarbij vooral immuungerelateerde genen opvallen.

<img width="400" height="500" alt="Volcanoplot_Casus(RA)" src="https://github.com/user-attachments/assets/41db9e32-b598-45cc-82f7-49a47df82ecd" />

*Figuur 2. Volcano plot van differentieel tot expressie komende genen.
Genen met een hoge absolute log₂ fold change en lage p-waarde bevinden zich aan de bovenste linker- en rechterzijde en vertegenwoordigen de meest uitgesproken verschillen tussen RA en controle. Significante genen zijn rood weergegeven*

##  Immuunrespons en lymfocytactivatie zijn verhoogd in RA synovium
De GO-verrijkingsanalyse bevestigt het beeld dat de volcano plot schetst en laat zien dat de betrokken genen voornamelijk geassocieerd zijn met de immuunrespons, zoals lymfocyten, adaptieve immuunrespons en immuunreceptorsignalen. Dit kan wijzen op een sterke activatie van zowel T- als B-cellen in RA.

<img width="400" height="350" alt="GO_plot" src="https://github.com/user-attachments/assets/367c1b9c-4a4b-4077-9530-7fb51afd0e56" />

*figuur 3 GO annalyse*
## Ontstekingsgerelateerde signaalroutes zijn verhoogd in RA
De KEGG pathway ondersteunt de bevindingen van de GO-analyse en de volcano plot en toont een verrijking van belangrijke signaalroutes zoals MAPK en PI3K-Akt, die een belangrijke rol spelen in ontsteking. Daarnaast worden er pathways gevonden die overlappen met infectieresponsen, wat duidt op een algemene immuunactiviteit.

<img width="400" height="350" alt="kegg_pathway_plot" src="https://github.com/user-attachments/assets/a0b3eac1-d284-4eb8-8797-da3767832458" />

*figuur 4 KEGG pathway*
## Cytokinesignalering speelt een centrale rol binnen de RA pathway
Figuur 5 laat zien dat meerdere proinflammatoire cytokinen, waaronder TNFα, IL1β, IL6 en IFNγ, verhoogd tot expressie kwamen. Daarnaast werden diverse chemokinen, waaronder CCL2, CCL13, CCL20, CXCL1 en IL8, opgereguleerd. Deze veranderingen wijzen op een verhoogde activatie van ontstekingsroutes en rekrutering van immuuncellen naar het synovium.

<img width="1492" height="859" alt="pathview casus RA" src="https://github.com/user-attachments/assets/649c22d2-77cb-497f-b6af-0f1a4079d661" />

*Figuur 5. KEGG Pathview-analyse van de rheumatoid arthritis-signaalroute. Rood gekleurde genen zijn opgereguleerd en groen gekleurde genen zijn neerwaarts gereguleerd ten opzichte van de controlegroep. De resultaten tonen een verhoogde expressie van genen betrokken bij immuunactivatie, cytokinesignalering, leukocytenmigratie en gewrichtsontsteking, passend bij de pathofysiologie van reumatoïde artritis.*


# conclusie
Dit onderzoek had als doel om met behulp van RNA sequencing te bepalen welke genen en biologische pathways verschillen tussen synoviumweefsel van patiënten met reumatoïde artritis (RA) en gezonde controles. De differentiële genexpressieanalyse liet zien dat RA gepaard gaat met veranderingen in genexpressie, waarbij vooral genen betrokken bij immuunactivatie en ontstekingsprocessen verhoogd tot expressie kwamen.
De GO analyse toonde een sterke verhoging van biologische processen gerelateerd aan de adaptieve immuunrespons, lymfocytactivatie en immuunreceptorsignalering. Daarnaast identificeerde de KEGG analyse belangrijke ontstekingsgerelateerde pathways, waaronder de PI3K-Akt- en MAPK-signaalroutes. De Pathview analyse van de rheumatoid arthritis pathway bevestigde deze bevindingen en liet verhoogde expressie zien van verschillende pro-inflammatoire cytokinen en chemokinen, waaronder TNF, IL1β, IL6, IFNγ, CCL2, CCL20 en CXCL8. Deze genen spelen een belangrijke rol bij immuuncelrekrutering, cytokinesignalering en het onderhouden van chronische gewrichtsontsteking.
De resultaten ondersteunen daarmee het huidige inzicht dat reumatoïde artritis een immuungemedieerde aandoening is waarbij ontregeling van ontstekings en immuunprocessen centraal staat. De gevonden veranderingen in genexpressie weerspiegelen de actieve ontstekingsstatus van het synovium.


## Samengevat
Dir onderzoek laat zien dat reumatoïde artritis wordt gekenmerkt door sterke transcriptomische veranderingen die voornamelijk betrekking hebben op immuun- en ontstekingsprocessen. De geïdentificeerde genen en pathways vormen potentiële aanknopingspunten voor verder onderzoek naar ziekteprocessen en toekomstige therapeutische strategieën

# Aanbevelingen
Een beperking van dit onderzoek is de kleine steekproefomvang van vier patiënten en vier controles, waardoor de resultaten met voorzichtigheid moeten worden geïnterpreteerd. Toekomstig onderzoek met een grotere hoeveelheden patiënten monster kan de betrouwbaarheid van de gevonden genen en pathways verhogen.
