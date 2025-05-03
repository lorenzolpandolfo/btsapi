import capitalize from "../../utils/utils";
import "./member.css";

export default function Member({
  name,
  full_name,
  birth_date,
  birth_city,
  first_solo_song,
  picture,
}) {
  return (
    <div className="member">
      <span className="name">{capitalize(name)}</span>
      <span className="full-name">{full_name}</span>
      <span className="birth-city">From {birth_city}</span>
      <span className="birth-date">Born in {birth_date}</span>
      <span className="first-solo-song">First Solo Song: {first_solo_song}</span>
      <img
        className="member-img"
        src={picture}
        alt={"A picture of " + name}
      />
    </div>
  );
}
