import React, { use, useEffect, useState } from 'react';
import { MomentType } from '../utils/types';
import {
  Box,
  Button,
  Card,
  CardContent,
  CardHeader,
  CardMedia,
  FormControlLabel,
  Grid,
  Switch,
} from '@mui/material';
import calculateDistance from '../utils/calculateDistance';
import { useMUD } from '../MUDContext';
import { useEntityQuery } from '@latticexyz/react';
import { Has, getComponentValueStrict } from '@latticexyz/recs';
import { CheckIn } from '../utils/types';

const MomentCard = ({ momentData, userLocation, momentId, wallet }: any) => {
  const [nftdetails, setNftdetails] = useState(null);
  const [matchingCheckIns, setMatchingCheckIns] = useState<CheckIn[]>([]);
  const [checkedIn, setCheckedIn] = useState(false);
  const [userOwnerMoment, setUserOwnerMoment] = useState(false);
  const isMomentLive = { inputProps: { 'aria-label': 'Is moment Live?' } };
  const {
    components: { CheckIn },
    systemCalls: { checkIn, toggleIsLive },
  } = useMUD();

  const checkInIds = useEntityQuery([Has(CheckIn)]);

  useEffect(() => {
    if (momentData.owner === wallet) {
      setUserOwnerMoment(true);
    }
  }, []);

  //check if user has checked in
  useEffect(() => {
    checkInIds.map((id: any) => {
      const thisCheckInMoment = getComponentValueStrict(CheckIn, id);
      // console.log('thisCheckInMoment string');
      // console.log('this is the users wallet', wallet);
      // console.log(
      //   'does it contain?',
      //   thisCheckInMoment.wallet.includes(wallet)
      // );
      if (`0x${thisCheckInMoment.wallet.substring(26)}` === wallet) {
        console.log('this is happening');
        setCheckedIn(true);
      }
    });

    // if (thisMomentCheckInIds.length > 0) {
    //   setMatchingCheckIns(thisMomentCheckInIds as unknown as CheckIn[]);
    // }
    // console.log('thisMomentCheckInIds', thisMomentCheckInIds);
  }, [checkInIds]);

  //fetch nft metadata
  useEffect(() => {
    const getNftMetadata = async () => {
      try {
        const result = await fetch(momentData.nftMetadata);
        const data = await result.json();
        // console.log('data', data);
        setNftdetails(data);
      } catch (error) {
        console.error(error);
      }
    };

    getNftMetadata();
  }, []);

  // const targetLocation = momentData.location.split(',');
  // console.log('targetLocation', targetLocation);

  const handleCheckIn = async () => {
    const range = 250; // in meters
    if (!userLocation) {
      alert('Please enable location services to check in.');
    }
    const targetLocation = momentData.location
      .split(',')
      .map((coord: any) => coord.trim());

    console.log('targetLocation', targetLocation);

    const distance = calculateDistance(
      userLocation.latitude,
      userLocation.longitude,
      targetLocation[0],
      targetLocation[1]
    );

    if (distance < range) {
      console.log('User is within range!');
      try {
        const result = await checkIn(momentId, wallet);
        console.log('result', result);
      } catch (error) {
        console.error(error);
      }
    } else {
      console.log('User is out of range.');
    }
  };

  const handleUpdateMomentIsLive = async () => {
    try {
      // do stuff
      const result = await toggleIsLive(momentId);
      console.log('result', result);
    } catch (error) {
      console.error(error);
    }
  };

  const NotOwnerMomentData = () => (
    <>
      {checkedIn ? (
        <p>You have checked in!</p>
      ) : (
        <Button
          variant="contained"
          disabled={!momentData.isLive}
          onClick={handleCheckIn}
        >
          Check In
        </Button>
      )}
    </>
  );

  const OwnerMomentData = () => {
    if (!momentData) return <></>;
    return (
      <Grid container spacing={2}>
        <Grid item xs={6}>
          <Button variant="contained">View CheckIns</Button>
        </Grid>
        <Grid item xs={6}>
          {/* <Box marginTop={2} marginBottom={2}> */}
          <FormControlLabel
            label="Toggle Live"
            control={
              // switch component is the current live state from on chain
              // if user is owner, they can toggle this

              // onchange will call a function that will call the system call to update the moment
              <Switch
                {...isMomentLive}
                defaultChecked={momentData.isLive}
                onChange={handleUpdateMomentIsLive}
              />
            }
          />
          {/* </Box> */}
        </Grid>
      </Grid>
    );
  };

  return (
    <Card>
      <CardHeader title={momentData.title} />
      <CardMedia
        sx={{ height: 250 }}
        component="img"
        image={nftdetails ? nftdetails?.image : ''}
      />
      <CardContent>
        <p>{momentData.description}</p>

        {userOwnerMoment ? <OwnerMomentData /> : <NotOwnerMomentData />}
      </CardContent>
    </Card>
  );
};

export default MomentCard;
