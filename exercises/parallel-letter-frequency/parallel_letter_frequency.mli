open Text

type freqs

(** Create a data structure representing the frequencies of letters in a string /*)
val create_frequencies : Text.t -> freqs

(** Extract the frequency for a letter from the above data structure *)
val frequency_for : freqs -> letter: char -> int
