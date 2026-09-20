import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';

const palette = {
  forest: '#0F3D2E',
  mintCream: '#ECF8E3',
  softMint: '#D7EED3',
};

export default function App() {
  return (
    <View style={styles.screen}>
      <StatusBar style="dark" />
      <View style={styles.mark}>
        <Text style={styles.sprout}>↟</Text>
      </View>
      <Text style={styles.title}>Leaflet</Text>
      <Text style={styles.subtitle}>Development foundation</Text>
      <View style={styles.status}>
        <Text style={styles.statusText}>Expo development client ready to configure</Text>
      </View>
      <Text style={styles.note}>
        Product features and AI are intentionally not implemented in this scaffold.
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  screen: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    gap: 12,
    paddingHorizontal: 28,
    backgroundColor: palette.mintCream,
  },
  mark: {
    width: 72,
    height: 72,
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 22,
    backgroundColor: palette.forest,
  },
  sprout: {
    color: palette.mintCream,
    fontSize: 34,
    fontWeight: '700',
  },
  title: {
    color: palette.forest,
    fontSize: 36,
    fontWeight: '700',
  },
  subtitle: {
    color: palette.forest,
    fontSize: 18,
    fontWeight: '600',
  },
  status: {
    marginTop: 8,
    paddingHorizontal: 16,
    paddingVertical: 10,
    borderRadius: 999,
    backgroundColor: palette.softMint,
  },
  statusText: {
    color: palette.forest,
    fontSize: 14,
    fontWeight: '600',
    textAlign: 'center',
  },
  note: {
    maxWidth: 360,
    color: palette.forest,
    fontSize: 14,
    lineHeight: 20,
    textAlign: 'center',
    opacity: 0.78,
  },
});
