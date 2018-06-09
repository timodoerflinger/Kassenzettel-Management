# kassenzettel-management-App

Das ist das github-Repository des IT-Projekts des 6. Semesters der hf-ict

Beschreibung:
In meiner Diplomarbeit erstelle ich eine App zur Kassenzettel-Verwaltung.
Für meinen Auftraggeber und mich persönlich sind die Kassenzettel verlorene
Daten, ausser man verwendet Sie zur persönlichen Analyse bzw. zum
Führen eines Haushaltsbuchs. Daher erstelle ich in meiner Diplomarbeit eine
iOS-App, mit welcher ein Kassenzettel fotografiert werden kann. Aus diesem
erstellten Abbild werden dann gewisse Werte bzw. Daten mit Hilfe eines
bereits bestehenden OCR-Frameworks ausgelesen und zur weiteren Verarbeitung
zwischengespeichert. Hier kann also unter anderem der Gesamtbetrag
ausgelesen und mit einem gesetzten monatlichen Budget verrechnet werden.
Dies soll dann auch kategorisiert werden können. Daraus ist ersichtlich, was
in dem laufenden Monat bereits in den verschiedenen Kategorien ausgegeben
wurde. Die Kategorien können jeweils individuell erstellt werden.

Dies ist ein IT-Projekt, welches die Grundlage für die Diplomarbeit ist. In diesem Projekt geht es um das Auslesen von Kassenzettel-Abbildern und den passenden Bildaufbereitungs-Funktionen und noch weitere spannende Pnukte. 

swiftocrtest:
Dies ist eine Test-App, in der das "SwiftOCR"-Framework eingebaut wurde. Das Framework ist sehr gut, beschreibt sich selbst aber als Framwork für einzeiliges Auslesen und ist daher eher unpassend für das Ziel dieses Projekts.

tesseractTest:
Dies ist eine Test-App, in der das "Tesseract OCR iOS"-Framwork eingebaut wurde. Das Framework ist sehr gut bei mehrzeiligem Auslesen und damit passend für dieses Projekt. Das Auslesen funktioniert nicht zu 100%. Doch die Auslese-Qualität kann mit gewissen Funktionen von Tesseract oder auch mit anderen Bildbearbeitungs-Funktionen noch aufgewertet werden. 

kassenzettel-management:
Dies ist die Master-App, die die Basis-App mit der Test-App von Tesseract und OpenCVImageStitching vereint. 

Dokumentation:
Die Abschluss-Dokumentation ist mit Latex erstellt worden. Die daraus generierte PDF ist hier unter dem Namen "dokumentation-it-projekt-6-semester-timo-doerflinger.pdf" zu finden. Die PDF-Datei mit den entsprechenden Latex-Dokumenten ist im Ordner dokumentation zu finden
