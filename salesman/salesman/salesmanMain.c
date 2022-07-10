#define _CRT_SECURE_NO_DEPRECATE
#include<stdio.h>
#include<string.h>
#include<stdbool.h>
#include<math.h>
#include<stdlib.h>
#include<time.h>
#define MAXCHAR 1000
#define length 6;
int main(void)
{
    FILE* fp = fopen("manyCities.csv", "r");
    if (fp == NULL)
    {
        printf("jsj");
        exit(0);
    }
    char* sp;
    char line[10];
    int value1;
    int value2;
    int citiesArray[100][2];
    int counter = 0;
    while (fgets(line, 10, fp) != NULL)
    {
        sp = strtok(line, ",");
        citiesArray[counter][0] = atoi(sp);
        sp = strtok(NULL, ",");
        citiesArray[counter][1] = atoi(sp);
        counter = counter + 1;
    }
    fclose(fp);
    //printf("\n%d", citiesArray[8][1]);
    //exit(0);
    float initTemperature = 10;

    float temperature;
    int k = 1;
    float coolingFactor;
    float initCoolingFactor = 0.000001;
    float prefDistance;
    float initPrefDistance = 1000000;
    float cityDistance[100][100];
    float randomValue;
    int randomNumber2;
    int randomNumber1;
    int tourPositionOne;
    int tourPositionTwo;
    float tourDistance;
    float difference;
    int swap1;
    int swap2;
    /*int citiesArray[8][2] = {
     {0, 1} ,
     {0, 2} ,
     {0, 0} ,
     {1, 2} ,
     {1, 0} ,
     {2, 0} ,
     {2, 1} ,
     {2, 2} ,
    };*/
    int numbCities = sizeof(citiesArray) / sizeof(citiesArray[0]);
    int randomTour[100];
    int tourOptimal[100];
    float tourMat[6][5];


    for (int i = 0; i < numbCities; ++i)
    {
        for (int j = 0; j < numbCities; ++j)
        {
            cityDistance[i][j] = sqrt(pow(citiesArray[i][1] - citiesArray[j][1], 2) + pow(citiesArray[i][0] - citiesArray[j][0], 2));
            //printf("%lf ", cityDistance[i][j]);

        }
        //printf("\n");
    }


    for (int tempIndex = 0; tempIndex < 6; ++tempIndex)
    {

        //temperature = initTemperature * pow(10, tempIndex);
        //printf("%lf ", temperature);
        printf("\n");
        for (int coolIndex = 0; coolIndex < 5; ++coolIndex)
        {
            /*printf("%lf ", coolingFactor);*/
            temperature = initTemperature * 0.0000001 * pow(10, tempIndex);
            coolingFactor = initCoolingFactor * pow(10, coolIndex);
            prefDistance = initPrefDistance;
            int tourOptimal[100];
            printf("%lf ", coolingFactor);
            printf("%lf ", temperature);
            for (int i = 0; i < numbCities; ++i) {
                randomTour[i] = i;
            }

            srand(time(NULL));
            for (int i = 0; i < 100000; ++i) {

                randomNumber1 = rand() % numbCities;
                randomNumber2 = rand() % numbCities;
                /*printf("\n");
                printf("%d ", randomNumber1);
                printf("%d ", randomNumber2);*/
                swap1 = randomTour[randomNumber1];
                swap2 = randomTour[randomNumber2];
                randomTour[randomNumber2] = swap1;
                randomTour[randomNumber1] = swap2;

                tourDistance = 0;
                //printf("\n");
                for (int i = 0; i < numbCities - 1; ++i) {
                    tourDistance = tourDistance + cityDistance[randomTour[i]][randomTour[i + 1]];
                    //printf("%lf ", cityDistance[randomTour[i]][randomTour[i + 1]]);
                    //printf("%d ", randomTour[i + 1]);

                }
                if (k == 1)
                {
                    //printf("%lf ", tourDistance);
                    k = 0;
                }
                difference = tourDistance - prefDistance;
                randomValue = (float)rand() / RAND_MAX;
                printf("%lf ",difference );
                if (difference < 0 || exp(-difference / temperature) > randomValue) {
                    prefDistance = tourDistance;
                    for (int k = 0; k < numbCities; ++k) {
                        tourOptimal[k] = randomTour[k];

                        //printf("%d ", randomTour[k]);
                    }

                }

                temperature = temperature * (1 - coolingFactor);
                //printf("%lf ", (1 - coolingFactor));

            }
            //printf("%lf ", temperature);
            //printf("%lf ", tourDistance);
            tourMat[tempIndex][coolIndex] = prefDistance;
        }
    }



    /*printf("%lf ", prefDistance);
    printf("\n");*/
    //for (int k = 0; k < numbCities; ++k) {
    //    tourOptimal[k] = randomTour[k];
    //    /*printf("\n");*/
    //    printf("%d ", tourOptimal[k]);
    //}

    for (int k = 0; k < 6; ++k) {
        for (int i = 0; i < 5; ++i) {
            //tourOptimal[k] = randomTour[k];
            /*printf("\n");*/
            printf("%lf ", tourMat[i][k]);
        }
        printf("\n");
    }

}