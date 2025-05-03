import { useState } from "react";
import "./App.css";
import axios from "axios";
import Member from "./components/member/member";
import MainHeader from "./components/header/MainHeader";
import capitalize from "./utils/utils";

const BTS_MEMBERS = ["jimin", "jungkook", "v", "suga", "jhope", "jin", "rm"];

function App() {
  const [member, setMember] = useState();
  const [searchName, setSearchName] = useState();

  const getMemberData = async (memberName) => {
    const response = await axios.get(
      "http://localhost:8000/member/" + memberName
    );
    setMember(response.data);
  };

  return (
    <>
      <div className="center-container">
        <MainHeader />
        <section className="search-section">
          <div className="search">
            <div className="members-list">
              {BTS_MEMBERS.map((member) => (
                <button type="button" onClick={() => getMemberData(member)}>
                  {capitalize(member)}
                </button>
              ))}
              <div className="input-area space-between">
                <input
                  type="text"
                  name="member-name"
                  id="member-name"
                  placeholder="Jimin"
                  onChange={(e) => setSearchName(e.target.value)}
                />
                <button
                  type="button"
                  onClick={() => getMemberData(searchName.toLowerCase())}
                >
                  Check
                </button>
              </div>
            </div>
          </div>
          <div className="member-card">
            {member ? (
              <Member {...member} />
            ) : (
              <span>Select or search a BTS member</span>
            )}
          </div>
        </section>
      </div>
    </>
  );
}

export default App;
