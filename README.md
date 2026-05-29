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
Voor de analyse is er gebruikt gemaakt van RNA-seqeucingdata afkomstig van synoviumbiopten. De data is afkomstig van vier gezonde personen en vier patiënten met reumatoïde artritis (RA). De verkregen ruwe sequencingdata werden aangeleverd als [FastQ bestanden](Ruwe_Data\Data_raw-RA) Met behulp van het Rsubread pakket (versie 2.24.0) zijn de reads uitgelijnd tegen het humane referentie genoom [GRCh38.p14](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/). Voor elk bestand werd vervolgens een BAM bestand gemaakt. Deze bestanden worden gesorteerd en geïdexeerd.

Met behulp van de functie FeatureCounts werd het aantal reads per gen bepaald op basis van de beschikbare GTF-annotatie. De verkregen data werden samengevoegd tot een countmatrix om vervolgens gekoppeld te worden aan de bijbehorende metadata van de monsters. Om verschillen in genexpressie tussen beide groepen te onderzoeken, is een differentiële genexpressieanalyse uitgevoerd met het pakket DESeq2 (versie 1.50.2). Hierbij werd de genexpressie van genen in de RA-groep vergeleken met de controlegroepen. Genen met een aangepaste p-waarde < 0,05 worden beschouwd als significant verschillend in expressie.

Voor de visualisatie van de resultaten is een volcano plot gemaakt met behulp van het EnhancedVolcano pakket (versie 1.28.2). Verder is er een Gene Ontology (GO) analyse en een KEGG-pathway analyse uitgevoerd op de significante genen om inzicht te krijgen in de signaalroutes en biologische processen die betrokken zijn bij reumatoïde artritis (RA).

De gebruikte [scrips](R_script), [ruwe data](Ruwe_Data) en tussenbestanden zijn opgenomen in de githubpagina.

<img width="1920" height="1080" alt="Flowchart" src="https://github.com/user-attachments/assets/7998f721-05a1-4560-8429-6b51962a7acb" />

*figuur 1. flowchart*

# Resultaten

De RNA-sequencinganalyse laat zien dat er duidelijke verschillen in genexpressie bestaan tussen RA-patiënten en de gezonde controlegroep. De volcano plot (figuur 2) toont aan dat veel genen significant veranderd zijn, zowel upregulated als downregulated, waarbij vooral immuungerelateerde genen opvallen.

<img width="400" height="500" alt="Volcanoplot_Casus(RA)" src="https://github.com/user-attachments/assets/41db9e32-b598-45cc-82f7-49a47df82ecd" />

*figuur 2 Volcano plot*

De GO-verrijkingsanalyse bevestigt het beeld dat de volcano plot schetst en laat zien dat de betrokken genen voornamelijk geassocieerd zijn met de immuunrespons, zoals lymfocyten, adaptieve immuunrespons en immuunreceptorsignalen. Dit kan wijzen op een sterke activatie van zowel T- als B-cellen in RA.

<img width="2000" height="1500" alt="GO_plot" src="https://github.com/user-attachments/assets/367c1b9c-4a4b-4077-9530-7fb51afd0e56" />

*figuur 2 GO annalyse*

De KEGG pathway ondersteunt de bevindingen van de GO-analyse en de volcano plot en toont een verrijking van belangrijke signaalroutes zoals MAPK en PI3K-Akt, die een belangrijke rol spelen in ontsteking. Daarnaast worden er pathways gevonden die overlappen met infectieresponsen, wat duidt op een algemene immuunactiviteit.

<img width="2000" height="1500" alt="kegg_pathway_plot" src="https://github.com/user-attachments/assets/a0b3eac1-d284-4eb8-8797-da3767832458" />

*figuur 3 KEGG pathway*

# Conclusie
Op basis van de RNA-sequencinganalyse kan worden geconcludeerd dat reumatoïde artritis gepaard gaat met aanzienlijke veranderingen in genexpressie in het synovium. Zowel de differentiële genexpressieanalyse als de GO- en KEGG-verrijkingsanalyses tonen aan dat vooral immuun- en ontstekingsprocessen sterk geactiveerd zijn.
Met name de betrokkenheid van T- en B-lymfocyten en belangrijke signaalroutes zoals PI3K-Akt en MAPK onderstrepen de centrale rol van het immuunsysteem in de pathofysiologie van RA. Daarnaast wijzen de gevonden infectiegerelateerde pathways op een algemene activatie van immuunmechanismen.
Deze resultaten bevestigen dat RA een immuungemedieerde ziekte is, waarbij verstoringen in genexpressie bijdragen aan chronische ontsteking in het synovium.

## Samengevat
De resultaten laten zien dat reumatoïde artritis gekenmerkt wordt door sterke veranderingen in genexpressie, waarbij immuun- en ontstekingsprocessen de meeste veranderingen laten zien.

# Aanbevelingen
Er wordt aanbevolen om een grotere groep patiënten te onderzoeken. Op deze manier vallen uitschieters beter op. Verder wordt er aanbevolen om de uitschietende genen specifiek te onderzoeken.
