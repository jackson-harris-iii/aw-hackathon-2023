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
  Modal,
  Snackbar,
  Switch,
  Typography,
} from '@mui/material';
import calculateDistance from '../utils/calculateDistance';
import { useMUD } from '../MUDContext';
import { useEntityQuery } from '@latticexyz/react';
import { Has, Type, getComponentValueStrict } from '@latticexyz/recs';
import { CheckIn } from '../utils/types';
import { removeAddressPadding } from '../utils/removeAddressPadding';

const style = {
  position: 'absolute' as 'absolute',
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  width: 400,
  bgcolor: 'background.paper',
  border: '2px solid #000',
  boxShadow: 24,
  p: 4,
};

const MomentCard = ({ momentData, userLocation, momentId, wallet }: any) => {
  const [nftdetails, setNftdetails] = useState(null);
  const [matchingCheckIns, setMatchingCheckIns] = useState<CheckIn[]>([]);
  const [checkedIn, setCheckedIn] = useState(false);
  const [userOwnerMoment, setUserOwnerMoment] = useState(false);
  const isMomentLive = { inputProps: { 'aria-label': 'Is moment Live?' } };
  const [notInRange, setNotInRange] = useState(false);
  const notInRangeClose = () => setNotInRange(false);
  const {
    components: { CheckIn },
    systemCalls: { checkIn, toggleIsLive },
  } = useMUD();

  const checkInIds = useEntityQuery([Has(CheckIn)]);

  //view checkins modal handlers
  const handleCreateMomentOpen = () => setIsViewCheckInsOpen(true);
  const handleClose = () => setIsViewCheckInsOpen(false);
  const [isViewCheckInsOpen, setIsViewCheckInsOpen] = useState(false);

  useEffect(() => {
    if (momentData.owner === wallet) {
      setUserOwnerMoment(true);
    }
  }, []);

  //check if user has checked in
  useEffect(() => {
    checkInIds.map((id: any) => {
      const thisCheckInMoment = getComponentValueStrict(CheckIn, id);

      if (removeAddressPadding(thisCheckInMoment.wallet) === wallet) {
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
      setNotInRange(true);
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
      {/* handle if there are no checkin ids */}
      {checkInIds.length === 0 ? (
        <Button
          variant="contained"
          disabled={!momentData.isLive}
          onClick={handleCheckIn}
        >
          Check In
        </Button>
      ) : (
        checkInIds.map((id: any) => {
          const thisCheckInMoment = getComponentValueStrict(CheckIn, id);
          console.log(
            'NOT OWNER MOMENT DATA ---- thisCheckInMoment',
            thisCheckInMoment
          );
          const checkInOwnerWallet = removeAddressPadding(
            thisCheckInMoment.wallet
          );
          const checkInMomentId = `0x${thisCheckInMoment.momentId.substring(
            64
          )}`;
          console.log('checkInOwnerWallet', checkInOwnerWallet);
          if (checkInOwnerWallet === wallet && momentId === checkInMomentId) {
            console.log('we are checked in here');
            return <p>You have checked in!</p>;
          } else {
            console.log('we are not checked in here');
            return (
              <Button
                variant="contained"
                disabled={!momentData.isLive}
                onClick={handleCheckIn}
              >
                Check In
              </Button>
            );
          }
        })
      )}
    </>
  );

  const ViewCheckInsModal = () => (
    <Modal
      open={isViewCheckInsOpen}
      onClose={handleClose}
      aria-labelledby="modal-modal-view-check-ins"
      aria-describedby="modal-modal-description-view-check-ins"
    >
      <Box sx={style}>
        <Typography
          id="modal-modal-title-view-check-ins"
          variant="h4"
          component="h3"
          textAlign={'center'}
        >
          Check Ins
        </Typography>
        <Grid container spacing={2}>
          {checkInIds.map((id) => {
            const checkInOfThisMoment = getComponentValueStrict(CheckIn, id);
            const thisCheckInMomentId = `0x${checkInOfThisMoment.momentId.substring(
              64
            )}`;
            console.log('thisCheckInMomentId', thisCheckInMomentId);
            console.log('checkInOfThisMoment', checkInOfThisMoment);
            console.log('momentId', momentId);
            if (!checkInOfThisMoment || thisCheckInMomentId !== momentId)
              return <></>;
            return (
              <Grid item xs={12} key={id} textAlign={'center'}>
                <Box marginTop={2} marginBottom={2}>
                  <Typography variant="h8">
                    {removeAddressPadding(checkInOfThisMoment.wallet)}
                  </Typography>
                </Box>
              </Grid>
            );
          })}
        </Grid>
      </Box>
    </Modal>
  );

  const OwnerMomentData = () => {
    if (!momentData) return <></>;
    return (
      <Grid container spacing={2}>
        <Grid item xs={6}>
          <Button variant="contained" onClick={handleCreateMomentOpen}>
            View CheckIns
          </Button>
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
          <ViewCheckInsModal />
        </Grid>
      </Grid>
    );
  };

  return (
    <>
      <Card key={momentId}>
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
      <Snackbar
        autoHideDuration={5000}
        anchorOrigin={{ vertical: 'top', horizontal: 'center' }}
        open={notInRange}
        onClose={notInRangeClose}
        message="Not In Range"
        key={'topcenter'}
        color={'red'}
      />
    </>
  );
};

export default MomentCard;
