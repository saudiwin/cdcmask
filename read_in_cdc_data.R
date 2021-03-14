cdc_masks <- read_csv("content/post/data/U.S._State_and_Territorial_Public_Mask_Mandates_From_April_10__2020_through_January_10__2021_by_County_by_Day.csv") %>%
  mutate(date=date(mdy_hm(date)),
         FIPS_County=as.character(FIPS_County),
         FIPS_State=as.character(FIPS_State),
         FIPS_County=case_when(nchar(FIPS_County)==1~paste0("00",FIPS_County),
                               nchar(FIPS_County)==2~paste0("0",FIPS_County),
                               nchar(FIPS_County)==3~FIPS_County),
         FIPS_State=ifelse(nchar(FIPS_State)==1,paste0("0",FIPS_State),FIPS_State),
         fips=paste0(FIPS_State,FIPS_County))

cdc_bars <- read_csv("content/post/data/U.S._State_and_Territorial_Orders_Closing_and_Reopening_Bars_Issued_from_March_11__2020_through_December_31__2020_by_County_by_Day.csv") %>%
  mutate(date=date(mdy_hms(date)),
         FIPS_County=as.character(FIPS_County),
         FIPS_State=as.character(FIPS_State),
         FIPS_County=case_when(nchar(FIPS_County)==1~paste0("00",FIPS_County),
                               nchar(FIPS_County)==2~paste0("0",FIPS_County),
                               nchar(FIPS_County)==3~FIPS_County),
         FIPS_State=ifelse(nchar(FIPS_State)==1,paste0("0",FIPS_State),FIPS_State),
         fips=paste0(FIPS_State,FIPS_County))

cdc_restaurants <- read_csv("content/post/data/U.S._State_and_Territorial_Orders_Closing_and_Reopening_Restaurants_Issued_from_March_11__2020_through_December_31__2020_by_County_by_Day.csv") %>%
  mutate(date=date(mdy_hms(date)),
         FIPS_County=as.character(FIPS_County),
         FIPS_State=as.character(FIPS_State),
         FIPS_County=case_when(nchar(FIPS_County)==1~paste0("00",FIPS_County),
                               nchar(FIPS_County)==2~paste0("0",FIPS_County),
                               nchar(FIPS_County)==3~FIPS_County),
         FIPS_State=ifelse(nchar(FIPS_State)==1,paste0("0",FIPS_State),FIPS_State),
         fips=paste0(FIPS_State,FIPS_County))

cdc_stay_home <- read_csv("content/post/data/U.S._State_and_Territorial_Stay-At-Home_Orders__March_15___December_31_by_County_by_Day.csv") %>%
  mutate(date=date(mdy_hms(date)),
         FIPS_County=as.character(FIPS_County),
         FIPS_State=as.character(FIPS_State),
         FIPS_County=case_when(nchar(FIPS_County)==1~paste0("00",FIPS_County),
                               nchar(FIPS_County)==2~paste0("0",FIPS_County),
                               nchar(FIPS_County)==3~FIPS_County),
         FIPS_State=ifelse(nchar(FIPS_State)==1,paste0("0",FIPS_State),FIPS_State),
         fips=paste0(FIPS_State,FIPS_County))

cdc_gather <- read_csv("content/post/data/U.S._State_and_Territorial_Gathering_Bans__March_11-December_31__2020_by_County_by_Day.csv") %>%
  mutate(FIPS_County=as.character(FIPS_County),
         FIPS_State=as.character(FIPS_State),
         FIPS_County=case_when(nchar(FIPS_County)==1~paste0("00",FIPS_County),
                               nchar(FIPS_County)==2~paste0("0",FIPS_County),
                               nchar(FIPS_County)==3~FIPS_County),
         FIPS_State=ifelse(nchar(FIPS_State)==1,paste0("0",FIPS_State),FIPS_State),
         fips=paste0(FIPS_State,FIPS_County))


saveRDS(cdc_masks,"content/post/data/cdc_masks.rds")
saveRDS(cdc_gather,"content/post/data/cdc_gather.rds")
saveRDS(cdc_bars,"content/post/data/cdc_bars.rds")
saveRDS(cdc_restaurants,"content/post/data/cdc_restaurants.rds")
saveRDS(cdc_stay_home,"content/post/data/cdc_stay_home.rds")
