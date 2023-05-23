import React, { useContext, useEffect, useState } from 'react';
import { UserContext } from '../utils/UserContext';
import { useEntityQuery } from '@latticexyz/react';
import { Has, getComponentValueStrict } from '@latticexyz/recs';
import { useMUD } from '../MUDContext';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Button,
  Modal,
  TextField,
  Switch,
  FormControlLabel,
  Container,
  Grid,
  CircularProgress,
} from '@mui/material';
import MenuIcon from '@mui/icons-material/Menu';
import AddCircleOutlineIcon from '@mui/icons-material/AddCircleOutline';
import LogoutIcon from '@mui/icons-material/Logout';
import RestoreIcon from '@mui/icons-material/Restore';
import { MomentType } from '../utils/types';
import MomentCard from './MomentCard';
import { NFTStorage, File, Blob } from 'nft.storage';
import { Create } from '@mui/icons-material';

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

// https://cdn.discordapp.com/attachments/1047616230611230770/1104089608930738237/jacksonthedev_Brickell_Miami_with_fancy_galaxy_starsnight_dream_9f67c669-0f58-4a6e-a0ec-a0a15ec7f493.png

const HomeScreen = () => {
  const [user, setUser] = useContext(UserContext);
  const [location, setLocation] = useState({});

  const {
    components: { Moment },
    systemCalls: { createMoment },
  } = useMUD();
  const momentIds = useEntityQuery([Has(Moment)]);

  const client = new NFTStorage({
    token: import.meta.env.VITE_NFT_STORAGE_TOKEN,
  });

  // modal handlers
  const handleCreateMomentOpen = () => setIsCreateMomentOpen(true);
  const handleClose = () => setIsCreateMomentOpen(false);
  const [isCreateMomentOpen, setIsCreateMomentOpen] = useState(false);

  // moment values
  const isMomentLive = { inputProps: { 'aria-label': 'Is moment Live?' } };
  const [momentLocation, setMomentLocation] = useState('');
  const [momentLat, setMomentLat] = useState('');
  const [momentLong, setMomentLong] = useState('');
  const [momentLocationType, setMomentLocationType] = useState('lat/long');
  const [momentDate, setMomentDate] = useState(0);
  const [momentStartTime, setMomentStartTime] = useState<Number>(0);
  const [momentEndTime, setMomentEndTime] = useState(0);
  const [momentIsLive, setMomentIsLive] = useState(false);
  const [momentTitle, setMomentTitle] = useState('');
  const [momentDescription, setMomentDescription] = useState('');
  const [submittingMoment, setSubmittingMoment] = useState(false);
  const [selectedFile, setSelectedFile] = useState<File | null>(null);

  const [momentName, setMomentName] = useState('');
  const [momentImageURL, setMomentImageURL] = useState('');

  // input handlers
  const handleMomentNameChange = (event: any) => {
    setMomentName(event.target.value);
  };

  const handleMomentLatChange = (event: any) => {
    setMomentLat(event.target.value);
  };

  const handleMomentLongChange = (event: any) => {
    setMomentLong(event.target.value);
  };

  const handleMomentLocationTypeChange = (event: any) => {
    setMomentLocationType(event.target.value);
  };

  const handleMomentDateChange = (event: any) => {
    setMomentDate(event.target.value);
  };

  const handleMomentStartTimeChange = (event: any) => {
    setMomentStartTime(event.target.value);
  };

  const handleMomentEndTimeChange = (event: any) => {
    setMomentEndTime(event.target.value);
  };

  const handleMomentIsLiveChange = (event: any) => {
    setMomentIsLive(event.target.checked);
  };

  const handleMomentTitleChange = (event: any) => {
    setMomentTitle(event.target.value);
  };

  const handleMomentDescriptionChange = (event: any) => {
    setMomentDescription(event.target.value);
  };

  const handleMomentImageURLChange = (event: any) => {
    setMomentImageURL(event.target.value);
  };

  const handleUploadClick = async (event: any) => {
    console.log('uploading');
    const file = event.target.files[0];

    if (!file) {
      console.log('sike');
      return;
    } else {
      console.log('doing things with this file', file);
      try {
        const someData = new Blob([file]);
        // const cid = await client.storeBlob(someData);
        setSelectedFile(file);
        console.log('file', file);
        // console.log('cid', cid);
      } catch (err) {
        console.log(err);
      }
    }
  };

  const createMomentHandler = async () => {
    setSubmittingMoment(true);
    try {
      //TODO:  create NFT metadata with nft.storage
      if (!selectedFile) {
        return;
      }
      const someData = new Blob([selectedFile]);
      const cid = await client.storeBlob(someData);
      const image_url = `https://${cid}.ipfs.nftstorage.link/`;
      const metaData = JSON.stringify({
        name: momentTitle,
        description: momentDescription,
        image: image_url,
      });
      const someMoreData = new Blob([metaData]);

      const metaDataCid = await client.storeBlob(someMoreData);

      const metaDataUrl = `https://${metaDataCid}.ipfs.nftstorage.link/`;

      const result = await createMoment({
        date: momentDate || 0,
        startTime: momentStartTime || 0,
        endTime: momentEndTime || 0,
        isLive: momentIsLive,
        owner: user.wallet,
        location: `${momentLat}, ${momentLong}`,
        // locationType: momentLocationType,
        title: momentTitle,
        description: momentDescription,
        nftMetadata: metaDataUrl,
      } as MomentType);
      console.log('result', result);
      setSubmittingMoment(false);
      setIsCreateMomentOpen(false);
    } catch (error) {
      setSubmittingMoment(false);
      setIsCreateMomentOpen(false);
      alert('Error creating moment');
      console.log(error);
    }
  };

  useEffect(() => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          setLocation({
            latitude: position.coords.latitude,
            longitude: position.coords.longitude,
          });
          // console.log('location', location);
        },
        (error) => {
          console.log(error);
        }
      );
    }
  }, [momentIds]);

  return (
    <>
      <Box sx={{ flexGrow: 1 }}>
        <AppBar position="static" style={{ backgroundColor: '#000000' }}>
          <Toolbar>
            {/* <IconButton
              size="large"
              edge="start"
              color="inherit"
              aria-label="menu"
              sx={{ mr: 2 }}
            >
              <MenuIcon />
            </IconButton> */}
            <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
              Moments
            </Typography>
            <IconButton
              size="large"
              edge="end"
              color="inherit"
              aria-label="create moment"
              sx={{ mr: 2 }}
              onClick={handleCreateMomentOpen}
            >
              <AddCircleOutlineIcon color="inherit" />
            </IconButton>

            {/* <IconButton
              size="large"
              edge="end"
              color="inherit"
              aria-label="history"
              sx={{ mr: 2 }}
              onClick={() => user.logout()}
            >
              <RestoreIcon color="inherit" />
            </IconButton> */}

            <IconButton
              size="large"
              edge="end"
              color="inherit"
              aria-label="logout"
              sx={{ mr: 2 }}
              onClick={() => user.logout()}
            >
              <LogoutIcon color="inherit" />
            </IconButton>
          </Toolbar>
        </AppBar>
      </Box>

      <Container sx={{ mt: 5 }}>
        <Typography variant="h5" component="h5" gutterBottom>
          <span style={{}}>My Wallet:</span> {user.wallet}
        </Typography>
        <div style={{ marginBottom: '2em' }}>
          <Typography variant="h5">
            My Location 📍:{' '}
            {location.latitude && (
              <>
                Lat: {location.latitude}, Long: {location.longitude}
              </>
            )}
          </Typography>
        </div>

        {/* Render Moment Cards */}
        <Grid container spacing={2}>
          <Grid item xs={12} lg={12}>
            <Typography
              variant="h4"
              component="h4"
              gutterBottom
              textAlign={'center'}
            >
              Moments
            </Typography>
          </Grid>

          {momentIds.map((id) => {
            const momentData: MomentType = getComponentValueStrict(Moment, id);
            if (!momentData) {
              return null;
            }
            // console.log('momentData', momentData);
            return (
              <Grid item xs={12} sm={6} md={4} lg={3} key={id + momentData}>
                <MomentCard
                  key={id}
                  momentData={momentData as MomentType}
                  momentId={id}
                  userLocation={location}
                  wallet={user.wallet}
                />
              </Grid>
            );
          })}
        </Grid>
      </Container>

      {/* Create Moment Modal */}
      <Modal
        open={isCreateMomentOpen}
        onClose={handleClose}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box sx={style}>
          <Typography id="modal-modal-title" variant="h6" component="h2">
            Create a Moment
          </Typography>
          <TextField
            id="momentTitle"
            label="momentTitle"
            type="momentTitle"
            fullWidth
            margin="normal"
            onChange={handleMomentTitleChange}
          />
          <TextField
            id="outlined-basic"
            label="description"
            variant="outlined"
            fullWidth
            margin="normal"
            onChange={handleMomentDescriptionChange}
          />
          <TextField
            id="latitutde"
            label="lat"
            variant="outlined"
            margin="normal"
            onChange={handleMomentLatChange}
          />
          <TextField
            id="longitude"
            label="long"
            variant="outlined"
            margin="normal"
            onChange={handleMomentLongChange}
          />
          {/* <TextField
            id="outlined-basic"
            label="image url"
            variant="outlined"
            fullWidth
            margin="normal"
            onChange={handleMomentImageURLChange}
          /> */}
          {/* <Button variant="contained" onClick={handleUploadClick} fullWidth> */}
          <Button variant="outlined" fullWidth>
            <input
              type="file"
              onChange={handleUploadClick}
              style={{ padding: '.75em' }}
            />
          </Button>
          {/* </Button> */}
          {/* <TextField
            id="date"
            // label="date"
            type="date"
            fullWidth
            margin="normal"
          /> */}
          {/* <TextField
            id="startTime"
            label="startTime"
            type="startTime"
            fullWidth
            margin="normal"
          />
          <TextField
            id="endTime"
            label="endTime"
            type="endTime"
            fullWidth
            margin="normal"
          /> */}
          <Box marginTop={2} marginBottom={2}>
            <FormControlLabel
              label="Is moment live?"
              control={
                <Switch {...isMomentLive} onChange={handleMomentIsLiveChange} />
              }
            />
          </Box>
          <Button variant="contained" onClick={createMomentHandler} fullWidth>
            {submittingMoment ? (
              <CircularProgress size={24} color="inherit" />
            ) : (
              <>Create Moment</>
            )}
          </Button>
        </Box>
      </Modal>
    </>
  );
};
export default HomeScreen;
