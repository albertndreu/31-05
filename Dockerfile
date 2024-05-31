# Βασική εικόνα με R και Shiny
FROM rocker/shiny:latest

# Εγκατάσταση απαραίτητων βιβλιοθηκών R
RUN R -e "install.packages(c('shiny', 'readr', 'readxl', 'ggplot2', 'plotly', 'Rtsne', 'caret', 'cluster', 'factoextra', 'class', 'e1071', 'caTools'))"

# Αντιγραφή της εφαρμογής στον κατάλογο /srv/shiny-server/
COPY app.R /srv/shiny-server/

# Έκθεση του πόρτου 3838
EXPOSE 3838

# Εκκίνηση του Shiny Server
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server', host = '0.0.0.0', port = 3838)"]