import React from "react";
import { FlatList, ScrollView, StyleSheet, Text, View } from "react-native";
import Card from "../Card/Card";

/**
 * Class FortniteNews
 */
class FortniteNews extends React.Component {

    /**
     * States about FortniteNews
     */
    state = {
        url: '',
        type: '',
        isLoaded: false,
        error: false,
        allNews: []
    };

    /**
     * Component FortniteNews CTOR
     * @param {*} props Props containing the type
     */
    constructor(props) {
        super(props);
        this.state = {
            url: 'https://fortniteapi.io/v1/news?lang=fr&type=',
            type: props.type,
            isLoaded: false,
            error: false
        };
    }

    /**
     * Triggered when the component is mount.
     * Here it just fetch the url to get the news by type (br, creative for example)
     * @returns nothing
     */
    componentDidMount() {
        fetch(this.state.url + this.state.type, {
            method: 'GET',
            headers: {
                'Authorization': 'c905ac22-2ef5e8bd-a9b0a0e0-9f4e3ba3'
            }
        }).then(res => {
            res.json().then(json => {
                this.setState({
                    allNews: json.news,
                    isLoaded: true
                })
            });
        }).catch(err => {
            this.setState({
                error: true
            });
        });
    }

    /**
     * Graphics
     * @returns JSX.Element
     */
    render() {
        if (this.state.error) {
            return (
                <Text style={{color:'black'}}>La récupération des données a échouée.</Text>
            );
        }
        if (!this.state.isLoaded) {
            return (
                <Text style={{color:'black'}}>Chargement des news...</Text>
            );
        } else {
            return (
                <View style={styles.container}>
                    <FlatList data={this.state.allNews}
                    renderItem={(key, value) => {
                            return <Card title={key.item.title} subtitle={key.item.tabTitle} image={key.item.image} description={key.item.body} video={key.item.video}/>
                        }
                    }
                    ></FlatList>
                </View>
            );
        }
    }
}

const styles = StyleSheet.create({
    container: {
        margin: 10
    }
})

export default FortniteNews;