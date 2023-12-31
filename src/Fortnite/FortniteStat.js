import React from "react";
import { Dimensions, ScrollView, StyleSheet, Text, View } from "react-native";

/**
 * Class FortniteStat
 */
class FortniteStat extends React.Component {
    /**
     * States about FortniteStat
     */
    state = {
        url: '',
        isLoaded: false,
        accountId: '',
        playerName: '',
        stats: [],
        error: false
    };

    /**
     * Component FortniteStat CTOR
     * @param {} props Props containing accountId, playerName
     */
    constructor(props) {
        super(props);
        this.state = {
            url: 'https://fortniteapi.io/v1/stats?account=',
            isLoaded: false,
            accountId: props.accountId,
            playerName: props.playerName,
            error: false
        };
    }

    /**
     * Triggered when the component is mount.
     * Here it just fetch the url with the accountId to get his stat
     * @returns nothing
     */
    componentDidMount() {
        if (this.state.accountId == '') return;
        fetch(this.state.url + this.state.accountId, {
            method: 'GET',
            headers: {
                'Authorization': 'c905ac22-2ef5e8bd-a9b0a0e0-9f4e3ba3'
            }
        }).then(res => {
            res.json().then(json => {
                this.setState({
                    stats: json,
                    isLoaded: true
                });
            });
        }).catch(err => {
            this.setState({
                error: true
            });
        });
    }

    /**
     * Parse the stat "minutesplayed" to the following format : XXh XXm XXs
     * @param {Number} minutesPlayed
     * @returns string parsed
     */
    parseTime(minutesPlayed) {
        var daysPlayed = minutesPlayed / 60 / 24;
        var hoursPlayed = daysPlayed % 1 * 24;
        var minutesPlayed = hoursPlayed % 1 * 60;
        var secondesPlayed = minutesPlayed % 1 * 60;

        return (`${parseInt(daysPlayed)}j ${parseInt(hoursPlayed)}h ${parseInt(minutesPlayed)}m ${parseInt(secondesPlayed)}s`)
    }

    /**
     * Parse the player stat to return a JSX.Element
     * @param {JSON} stats every stat of the player
     * @param {String} mode gamemode
     * @returns JSX.Element
     */
    writeStat(stats, mode) {
        return (
            <View style={styles.statContainer}>
                <View elevation={3} style={styles.Container}>
                    <Text style={styles.text}>Donnée de {this.state.stats["name"] ? this.state.stats["name"] : "Error"} en {mode} :</Text>
                    <Text style={styles.text}>Nombre de Top1 effectué : {stats.placetop1 !== null ? stats.placetop1 : "Error"}</Text>
                    <Text style={styles.text}>Nombre de Top3 effectué : {stats.placetop3 !== null ? stats.placetop3 : "Error"}</Text>
                    <Text style={styles.text}>Nombre de Top5 effectué : {stats.placetop5 !== null ? stats.placetop5 : "Error"}</Text>
                    <Text style={styles.text}>Nombre de Top10 effectué : {stats.placetop10 !== null ? stats.placetop10 : "Error"}</Text>
                    <Text style={styles.text}>Nombre de kill effectué : {stats.kills !== null ? stats.kills : "Error"}</Text>
                    <Text style={styles.text}>Nombre de match joué : {stats.matchesplayed !== null ? stats.matchesplayed : "Error"}</Text>
                    <Text style={styles.text}>Temps de jeu effectué : {stats.minutesplayed !== null ? this.parseTime(stats.minutesplayed) : "Error"} </Text>
                </View>
            </View>
        );
    }

    /**
     * Graphics
     * @returns JSX.Element
     */
    render() {
        if (this.state.error) {
            return (
                <Text style={styles.text}>Erreur lors du chargement des stats.</Text>
            );
        }
        if (!this.state.isLoaded) {
            return (
                <Text style={styles.text}>Chargement des stats…</Text>
            );
        } else {
            return (
                <View>
                    <ScrollView>
                        <View style={styles.header}>
                            <Text style={styles.username}>{this.state.playerName}</Text>
                            <Text style={styles.text}>Level : {this.state.stats["account"]["level"] === null ? 0 : this.state.stats["account"]["level"]}</Text>
                        </View>
                        {this.state.stats["global_stats"] !== null ? this.writeStat(this.state.stats["global_stats"]["solo"], "solo") : <Text>Donnée de ce joueur en solo indisponible.</Text>}
                        <Text/>
                        {this.state.stats["global_stats"] !== null ? this.writeStat(this.state.stats["global_stats"]["duo"], "duo") : <Text>Donnée de ce joueur en duo indisponible.</Text>}
                        <Text/>
                        {this.state.stats["global_stats"] !== null ? this.writeStat(this.state.stats["global_stats"]["squad"], "squad") : <Text>Donnée de ce joueur en squad indisponible.</Text>}
                    </ScrollView>
                </View>
            );
        }
    }
}

const styles = StyleSheet.create({
	text: {
        color: 'white'
    },
    username: {
        fontSize: 20,
        fontWeight: "bold",
        color: 'white'
    },
    statContainer: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'rgba(0, 0, 0, 0.35)'
    },
    Container: {
        borderRadius: 2,
        padding: 10,
        shadowColor: 'black',
        shadowOpacity: 1.0
    },
    header: {
        marginTop: 10,
        alignItems: 'center',
    }
});

export default FortniteStat;