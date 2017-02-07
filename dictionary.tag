<dictionary>
    <div id="content">
        <img src={img_path} id="chord-image"><br/>
        <div class="option-wrapper">
            <label for="chord-root">Root</label>
            <select id="chord-root" name="chord-option">
                <option each={option in chord_roots} value={option.value} selected={current==option.value}>
                    {option.title}
                </option>
            </select>
        </div>
        <div class="option-wrapper">
            <label for="chord-variant">Variant</label>
            <select id="chord-variant" name="chord-option">
                <option each={option in chord_variants} value={option.value} selected={current==option.value}>
                    {option.title}
                </option>
            </select>
        </div>
        <div class="option-wrapper">
            <label for="chord-fingering">Fingering</label>
            <select id="chord-fingering" name="chord-option">
                <option each={option in chord_fingerings} value={option.value} selected={fingering==option.value}>
                    {option.title}
                </option>
            </select>
        </div>
    </div>
    <script>
        var _this = this;
        _this.chord_roots = [
            {value: 'c', title: 'C'},
            {value: 'd-flat', title: 'C♯/D♭'},
            {value: 'd', title: 'D'},
            {value: 'e-flat', title: 'D♯/E♭'},
            {value: 'e', title: 'E'},
            {value: 'f', title: 'F'},
            {value: 'g-flat', title: 'F♯/G♭'},
            {value: 'g', title: 'G'},
            {value: 'a-flat', title: 'G♯/A♭'},
            {value: 'a', title: 'A'},
            {value: 'b-flat', title: 'A♯/B♭'},
            {value: 'b', title: 'B'}
        ];

        _this.chord_variants = [
            {value: 'major', title: 'Major'},
            {value: 'minor', title: 'Minor'}
        ];

        _this.chord_fingerings = [
            {value: '1', title: '1st Fingering'},
            {value: '2', title: '2nd Fingering'},
            {value: '3', title: '3rd Fingering'},
            {value: '4', title: '4th Fingering'},
            {value: '5', title: '5th Fingering'},
            {value: '6', title: '6th Fingering'}
        ];

        _this.fingering = 1;

        // When initialized, the first png to display
        _this.img_path = 'images/c-major-01.png';

        _this.on('mount', function () {
            $('[name="chord-option"]').change(function () {

                var root = $("#chord-root").val();
                var variant = $("#chord-variant").val();
                _this.fingering = $("#chord-fingering").val();

                _this.chord_fingerings = buildFingeringOptions(getFingeringCount(root, variant));
                _this.img_path = 'images/' + getImageName(root, variant, _this.fingering);
                _this.update();
            });
        });

        function buildFingeringOptions(fingering_count) {
            // Take the number of different fingerings we have for the root +
            // variant combo and build the options list for the dropdown menu
            var fingering_options = [
                {value: '1', title: '1st Fingering'},
                {value: '2', title: '2nd Fingering'},
                {value: '3', title: '3rd Fingering'},
                {value: '4', title: '4th Fingering'},
                {value: '5', title: '5th Fingering'},
                {value: '6', title: '6th Fingering'},
                {value: '7', title: '7th Fingering'},
                {value: '8', title: '8th Fingering'},
                {value: '9', title: '9th Fingering'},
                {value: '10', title: '10th Fingering'}
            ];

            var chord_fingerings = [
            ];

            for (i = 0; i < fingering_count; i++){
                chord_fingerings.push(fingering_options[i]);
            }
            return chord_fingerings;
        }

        function getFingeringCount(root, variant) {
            // Take a root and a variant and return the number of fingerings
            // we have for that root + variant combo
            return Object.keys(chord_image_names[root][variant]).length;
        }

        function getImageName(root, variant, fingering){
            return chord_image_names[root][variant][fingering];
        }

        var chord_image_names = {
            'c': {
                'major': {
                    1 : 'c-major-01.png',
                    2 : 'c-major-02.png',
                    3 : 'c-major-03.png',
                    4 : 'c-major-04.png',
                    5 : 'c-major-05.png',
                    6 : 'c-major-06.png'
                },
                'minor': {
                    1 : 'c-minor-01.png',
                    2 : 'c-minor-02.png',
                    3 : 'c-minor-03.png',
                    4 : 'c-minor-04.png',
                    5 : 'c-minor-05.png'
                }
            },
            'd-flat': {
                'major': {
                    1 : 'd-flat-major-01.png',
                    2 : 'd-flat-major-02.png',
                    3 : 'd-flat-major-03.png',
                    4 : 'd-flat-major-04.png'
                },
                'minor': {
                    1 : 'd-flat-minor-01.png',
                    2 : 'd-flat-minor-02.png',
                    3 : 'd-flat-minor-03.png'
                }
            },
            'd': {
                'major': {
                    1: 'd-major-01.png',
                    2: 'd-major-02.png',
                    3: 'd-major-03.png',
                    4: 'd-major-04.png',
                    5: 'd-major-05.png',
                    6: 'd-major-06.png',
                    7: 'd-major-07.png'
                },
                'minor': {
                    1: 'd-minor-01.png',
                    2: 'd-minor-02.png',
                    3: 'd-minor-03.png'
                }
            },
            'e-flat': {
                'major': {
                    1: 'e-flat-major-01.png',
                    2: 'e-flat-major-02.png',
                    3: 'e-flat-major-03.png',
                    4: 'e-flat-major-04.png',
                    5: 'e-flat-major-05.png',
                    6: 'e-flat-major-06.png'
                },
                'minor': {
                    1: 'e-flat-minor-01.png',
                    2: 'e-flat-minor-02.png',
                    3: 'e-flat-minor-03.png'
                }
            },
            'e': {
                'major': {
                    1: 'e-major-01.png',
                    2: 'e-major-02.png',
                    3: 'e-major-03.png',
                    4: 'e-major-04.png',
                    5: 'e-major-05.png',
                    6: 'e-major-06.png'
                },
                'minor': {
                    1: 'e-minor-01.png',
                    2: 'e-minor-02.png',
                    3: 'e-minor-03.png',
                    4: 'e-minor-04.png'
                }
            },
            'f': {
                'major': {
                    1: 'f-major-01.png',
                    2: 'f-major-02.png',
                    3: 'f-major-03.png',
                    4: 'f-major-04.png',
                    5: 'f-major-05.png'
                },
                'minor': {
                    1: 'f-minor-01.png',
                    2: 'f-minor-02.png',
                    3: 'f-minor-03.png'
                }
            },
            'g-flat': {
                'major': {
                    1: 'g-flat-major-01.png',
                    2: 'g-flat-major-02.png',
                    3: 'g-flat-major-03.png',
                    4: 'g-flat-major-04.png',
                    5: 'g-flat-major-05.png'
                },
                'minor': {
                    1: 'g-flat-minor-01.png',
                    2: 'g-flat-minor-02.png',
                    3: 'g-flat-minor-03.png'
                }
            },
            'g': {
                'major': {
                    1: 'g-major-01.png',
                    2: 'g-major-02.png',
                    3: 'g-major-03.png',
                    4: 'g-major-04.png',
                    5: 'g-major-05.png',
                    6: 'g-major-06.png',
                    7: 'g-major-07.png'
                },
                'minor': {
                    1: 'g-minor-01.png',
                    2: 'g-minor-02.png',
                    3: 'g-minor-03.png'
                }
            },
            'a-flat': {
                'major': {
                    1: 'a-flat-major-01.png',
                    2: 'a-flat-major-02.png',
                    3: 'a-flat-major-03.png',
                    4: 'a-flat-major-04.png',
                    5: 'a-flat-major-05.png',
                    6: 'a-flat-major-06.png'
                },
                'minor': {
                    1: 'a-flat-minor-01.png',
                    2: 'a-flat-minor-02.png',
                    3: 'a-flat-minor-03.png'
                }
            },
            'a': {
                'major': {
                    1: 'a-major-01.png',
                    2: 'a-major-02.png',
                    3: 'a-major-03.png',
                    4: 'a-major-04.png',
                    5: 'a-major-05.png',
                    6: 'a-major-06.png',
                    7: 'a-major-07.png'
                },
                'minor': {
                    1: 'a-minor-01.png',
                    2: 'a-minor-02.png',
                    3: 'a-minor-03.png',
                    4: 'a-minor-04.png',
                    5: 'a-minor-05.png'
                }
            },
            'b-flat': {
                'major': {
                    1: 'b-flat-major-01.png',
                    2: 'b-flat-major-02.png',
                    3: 'b-flat-major-03.png',
                    4: 'b-flat-major-04.png',
                    5: 'b-flat-major-05.png',
                    6: 'b-flat-major-06.png',
                    7: 'b-flat-major-07.png'
                },
                'minor': {
                    1: 'b-flat-minor-01.png',
                    2: 'b-flat-minor-02.png',
                    3: 'b-flat-minor-03.png',
                    4: 'b-flat-minor-04.png'
                }
            },
            'b': {
                'major': {
                    1: 'b-major-01.png',
                    2: 'b-major-02.png',
                    3: 'b-major-03.png',
                    4: 'b-major-04.png',
                    5: 'b-major-05.png',
                    6: 'b-major-06.png'
                },
                'minor': {
                    1: 'b-major-01.png',
                    2: 'b-major-02.png',
                    3: 'b-major-03.png'
                }
            }
        };
    </script>
</dictionary>