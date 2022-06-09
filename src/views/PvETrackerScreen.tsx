import React, {useEffect, useState} from "react";

import {Box, FlatList, Input, Pressable, Text, View, VStack} from "native-base";
import {ImageBackground} from "react-native";

import CenteredAlert from "../components/CenteredAlert";
import {fetchUsers} from "../utils/BungieAPI";

import {SerializeUserInfo} from '../utils/utils';
import {UserInfoCard} from "../types/UserInfoCard.type";

export default function PvETrackerScreen() {
    const [userList, setUserList] = useState<Array<UserInfoCard>>([]);
    const [isError, setError] = useState<boolean>(false);
    const [bungieId, setBungieId] = useState<string>('');

    const [test, setTest] = useState<string>('');

    const [isFocused, setInputFocus] = useState<boolean>(false);

    useEffect(() => {
        let usersList: Array<UserInfoCard> = [];

        fetchUsers(bungieId).then((data) => {
            if (data === null)
                setError(true);
            for (const userInfo of data.Response.searchResults)
                usersList = [...usersList, SerializeUserInfo(userInfo)];
            setUserList(usersList);
        });
    }, [bungieId]);

    return <>
        <ImageBackground source={require('../../assets/D2Background.jpg')} style={{ width: '100%', height: '100%' }}>
            <View flex='1' alignItems='center'>
                <VStack safeAreaTop w='90%' alignItems='center'>
                    <Input
                        variant='underlined'
                        w='85%'
                        size='md'
                        onFocus={() => setInputFocus(true)}
                        onBlur={() => setInputFocus(false)}
                        style={{ color: '#ffffff' }}
                        placeholder='Guardian Display Name'
                        onChangeText={(guardianDisplayName: string) => setBungieId(guardianDisplayName)}
                    />
                    { !test ? <FlatList
                        w='85%'
                        data={userList}
                        renderItem={({item}) => (
                            <Pressable onPress={() => setTest('ALED')} backgroundColor='#ffffff' borderBottomWidth='1' _dark={{borderColor: 'coolGray.200'}} pl='4' pr='5' py='2'>
                                {/*<HStack space={3} justifyContent='space-between'>*/}
                                    <Text _dark={{color: 'warmGray.200'}} bold>
                                        {item.bungieGlobalDisplayName + '#' + item.bungieGlobalDisplayNameCode}
                                    </Text>
                                {/*</HStack>*/}
                            </Pressable>
                            )
                        }
                        keyExtractor={(_, index) => index.toString()}
                    /> : null }
                </VStack>
            </View>
            {isError ?
                <CenteredAlert
                    status='error'
                    title='Error when fetching users!'
                    description='An error occurred when trying to fetch users using Bungie API.'
                    onClose={() => setError(false)}
                /> : null
            }
        </ImageBackground>
    </>
}