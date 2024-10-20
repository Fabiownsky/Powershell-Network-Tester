<a id="readme-top"></a>
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<div align="center">
  <h3 align="center">Powershell Network Tester</h3>
  <p align="center">An easy to use Internect Connection Tester, constantly checking download and upload speed and ping latency</p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#view-the-results">View The Results</a></li>
    <li><a href="#troubleshooting-tips">Troubleshooting Tips</a></li>
  </ol>
</details>

## About The Project
There are some online and easy to use tools to check your ping and/or you download and upload speed, but very few capable of doing those tests continously in order to check unusual and rare network behaviour.

This is my personal solution of this problem: a simple Powershell script capable of continous network testing. As you can see, you'll be free to choose the time between tests by using the `-t` parameter.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started
I made the project to be used in the easiest way possible. The only things you need to do are very easy to follow and they will need just a 2 minutes setup.

### Prerequisites
The prerequisites for the script to work are:
* Git Clone the repository or manually download the `Network-Tester.ps1`
* Download the latest `speedtest-cli` from the [official page](https://www.speedtest.net/it/apps/cli) (Windows version) and extract the `speedtest.exe`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Installation
After you downloaded the script and the `speedtest-cli`, make sure to:
1. Create a new working Directory and extract the script `Network-Tester.ps1` and the `speedtest.exe`
2. Give the script acces in order to be executed on Powershell (check the Troubleshooting section)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage
The usage is pretty straightforward:
1. Open Powershell as **Administrator**
2. Navigate to the working directory (by using `cd`)
3. Now we have to execute the script by choosing our time preference following one of the following choices:
   1. Using the default 10 seconds between test: ```.\Network-Tester.ps1```
   2. Using a custom time interval (e.g. 60 seconds): ```.\Network-Tester.ps1 -t 60```
4. Stop the script by typing the combination `Ctrl + C` in the Powershell window

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### View the results
In the same working directory you used, you'll now find a new file `log.txt`.
You just need to open it and check your entire log.
**Rembember**: the file will not be overwritten, but will append to the already existing `log.txt` file.

## Troubleshooting Tips
1. **`"Execution Policy Error"`**:  if PowerShell blocks the script, ensure you've properly set the execution policy. If you're unsure, you can temporarily bypass the restriction of the current Poweshell window by running the script as follows:
`Set-ExecutionPolicy Bypass -Scope Process` .
You'll need to execute the script again if you open a new Powershell window, but it's the safest method at the moment
**NEVER change your Poweshell execution policy permanently for security reasons.**
2. **Error with `speedtest-cli`**: ensure that  the `speedtest.exe` in the same directory of the script and that it's executable.
3. **Log file not created**: ensure that both the `speedtest.exe` and the `Network-Tester.ps1` are in the same directory. The script relies on this to make the `log.txt` file.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Roadmap

- [x] Add a custom user time parameter `-t`
- [ ] Add custom ping server
- [ ] Add a simple and a more exhaustive log

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/Fabiownsky/Powershell-Network-Tester/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]:  https://www.linkedin.com/in/fabio-porcelli-702742302
