# Casus-Reumato-de-Artritis-RA-
Verwerkte en onverwerkte data vanuit een Reuma Artritis (RA) onderzoek met behulp van R
# Inleiding
Reumatoïde artritis (RA) is een chronische auto-imuunziekte waarbij het imuunsysteem gezonde gewrichten aanvalt. Hierdoor ontstaan ontstekingen in onder andere de handen, polsen en knieën, wat kan leiden tot stijfheid, pijn en blijvende gewrichtsklachten. Naast gewrichtsklachten kan RA ook andere organen aantasten, zoals  de longen en het hart. De ziekte heeft daardoor een grote invloed op de kwalliteit van leven van patiënten. Wereldwijd komt RA voor bij ongeveer 0,5% van de bevolking. De aandoening wordt vaker gezien bij vrouwen dan bij mannen (Almutairi et al., 2020).

De exacte oorzak van RA is nig niet volledig bekend, maar onderzoek laat zien dat zowel genetische als omgevingsfactoren een belangrijke rol spelen. Risicofactoren zoals roken, overgewicht en bepaalde infecties kunnen bijdragen aan het onstaan van de ziekete. Daarnaast speelthet immuunsysteem een centrale rol bij de ontwikkeling van chronische ontstekingen in synoviale weefsels van gewrichten.(Romão & Fonseca, 2021)

Bij RA spelen verschillendde intracellulaire signaalroutes een belangrijke rol in het ontstaan en onderhouden van ontstekingen. Een van de deze signaal routes is de JAK-STAT signaalroute. Deze pathway wordt geactiveerd door cytokinen zoals interleukine 6 (IL-6) en interferonen. Activatie van JAK-STAT zorgt ervoor dat onstekingsgenen in de celkern worden geactiveer, waardo chromische onstekingen in de gewrichten ontstaan(Ciobanu et al., 2020). Het doel van dit onderzoek is om met behulp van RNA-sequencingsdata, geannalyseerd in R, te bepalen welke genen en biologische pathways significant verschillen in expressie tussen synoviumbyopten van RA patiënten en gezonden controles.
## Beheren
`bronnen` - Hier staat een word document met de verwijzingen naar alle gebruikte bronnen.
`grafieken`- Hier staan alle gemaakt grafieken.
`R script`- Hier staan de gebruikte R scripten.
`Ruwe data`- Hier staan de ruwe data en de BAM bestanden die gemaakt zijn.


# Methode
Voor de analyse is er gerbuik gemaakt van RNA seqeucingdata afkomstig van synoviumbiopten. De data is afkomstig van vier gezonde personen en vier patiënten met reumatoïde artritis (RA). De verkregen ruwe sequencingdata werden aangeleverd als FastQ bestanden (link) Met behulp van het Rsubread pakket (versie 2.24.0) zijn de reads uitgelijnd tegen het humane referentie genoom GRCh38.p14 (link). Voor elk bestand werd vervolgens een BAM bestand gemaakt. Deze bestanden worden gesorteerd en geïdexeerd.

Met behulp van de functie Featurecounts werd het aantal reads per gen bepaald op basis van de beschikbare GTF annotatie. De verkregen data werden samengevoegd tot een countmatrix om vervolgens gekoppeld te worden aan de bijbhorende metadata van de monsters. Om verschillen in genexpressie tussen beide groepen te onderzoeken, is een differentiële genexpressie annalyse uitgevoerd met het pakket DEseq2 (versie 1.50.2). Hierbij werd de genexpressie van genen in de RA groep vergeleken met de controlegropen. Genen met ene aangepaste P waarde <0,05 worden beschouwd als significant verschillend in expressie.

Voor de visualisatie van de resultaten is een volcano plot gemaakt met behulp van het EnhancedVolcano pakket (versie 1.28.2). Verder is er een Gene Ontology(GO) analyse en een KEGG-pathway analyse uitgevoerd op de significante genen om inzicht te krijgen in de signaalroutes en biologische processen die betrokken zijn bij Reumatoïde artritis(RA).

De gebruikte scrips(link), ruwe data(link) en tussen bestanden zijn opgenomen in de githubpagina.

<img width="1920" height="1080" alt="Flowchart" src="https://github.com/user-attachments/assets/7998f721-05a1-4560-8429-6b51962a7acb" />

*figuur 1. flowchart*

# Resultaten

De RNA sequencingsanalyse laat zien dat er duidelijke verschillen in genexpressie bestaan tussen RA patiënten en de gezonde controle groep. De volcano plot (figuur 2) toont aan dat veel genen siginficant veranderd zijn, zowel upregulated als downregulated, waarbij vooral immuungerelateerde genen opvallen.
<img width="400" height="500" alt="Volcanoplot_Casus(RA)" src="https://github.com/user-attachments/assets/41db9e32-b598-45cc-82f7-49a47df82ecd" />

*figuur 2 Volcano plot*

De GO verrijkingsannalyse bevestigd het beeld dat de volcano plot schetst en laat zien dat de betrokken genen voornamelijk geassocieerd zijn met de immuunrespons, zoals lymfocyten, adaptieve imuunrespons en immuunreceptor signalen. Dit kan wijzen op een sterke activatie van zowel T als B cellen in RA.
<img width="2400" height="1800" alt="GO_plot" src="https://github.com/user-attachments/assets/367c1b9c-4a4b-4077-9530-7fb51afd0e56" />

De KEGG pathway ondersteund de bevindingen van de GO analyse en de volcano plot en toont een verrijking van de belangrijke singaalroutes zoals MAPK en PI3K-AKt die en belangrijke rol spelen in ontsteking. Daarnaast worden er pathways gevonden die overlappen met infectiereponsen, wat duidt op een algemene immuunactiviteit.
<img width="2400" height="1800" alt="kegg_pathway_plot" src="https://github.com/user-attachments/assets/a0b3eac1-d284-4eb8-8797-da3767832458" />

*figuur 3 KEGG pathwat+y*
# Conclusie

## Samengevat
De resulaten laten zien dat reumatoïde artritis gekenmerkt is wordt door sterke veranderingen in genexpressie, waarbij imuun en ontstekkingsprocessen de meeste veranderingen lieten zien.
