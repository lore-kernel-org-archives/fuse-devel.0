Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D356140D58E
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 11:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201072; cv=none; b=iA5Pd7SBU19Htzn70dRaKBxcQQURJ5zvadneymzlksvHr8N50JyMhJNElgA6F5XMGuG/Szt7Z/bK8qmW4sL275yBrpUohvgGY6HowsYQJMe8ADX+K6Uv/W2unBbLLZCzrKlHEJbDI69KgBN5f9yZL7AqNrNBGypgz8u7EY1zJWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201072; c=relaxed/simple;
	bh=3UdHm+M8lKa5MLSdTYWeeHBIbgSQfbVPCv/3tSzGdDQ=;
	h=Mime-Version:From:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqo3Zj3wXDJeIAIcC1xL+zX4MdJcSlIWYcw4UnNz/zALagtsmt2e7u0bJBCpz6fO+ysKBzernD+vhdIHy/Z8YskfhttvLUKtxI24Z+HbYW1VFs5+KMaRT3Koy0ZTT/PIyKLQDDaIVrER0qcAeafzE3M4I+LnPRFa7zjtGWxt4aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so5125194e87.0
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 04:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201069; x=1784805869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTzxnY7b/gLeO67eQm2TEajWopCh2GV8+8KAlY+37SQ=;
        b=CV5FY9n4ajVyv1clnQ1qHmdc/k88kDpyS99Ixmj1qCq0mUJI0lmOy+ZYZhCfphTprD
         VbwxBSHVW2e1NNqDTQuV7irKbSa5APVLMcXCUUSIMp46TbY66uNrA5MVxzyEurP0V3sE
         bCeFQaVzQOjDXi3CnNuCeLOVbANaHNClbr7yvkZACSLy9DtRP38EHfpOh15HPJgLBa13
         NY3P6RAggZGwQ+e/jEpaK/ETkhMu5jwTufCJ+TK9xrK0SWjMfYR1PMf7RUW8HKbl61gR
         UxPMVtBwm37SBk2A4HeXf8VNHyuM1/+WPJTKKy4ODmj9vPDIAXTZuSHgDVUWrxqfFXMP
         o+8w==
X-Forwarded-Encrypted: i=1; AHgh+RrCfPsd5OXJ1zuABWV1f+KS6/iupaYK6jAgbF5efJuoPguRX8LTC+MAkgILE51decQ8Ofp5yPMQvjzz@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1fGgBO1mYWS8kco1ggbXTAfIi8SKGejq57Bz1hMwl8VdkeSGL
	JwO5vesBg/Z7tjZ989J88MYTr/s2/zYD5iqg66Qes29F/fmKT6Rnq26PAhKOLR4ThRA=
X-Gm-Gg: AfdE7ckfAKUArHal2MhSXzq593vNTCVGbPoIDFxQAYz+VtyA0rpg+PoS9QQPIj33zoj
	UrjBhC/xEHVQtvoOpxoL8I4PO244u3b7LxqCkY+S1pfTKTWkjm2GFmA1F6SNDJsbBo6IZXXmdF9
	jXF6KGWaXCuzsTo23Tk7vp/kHMY32qUd/9opjmlAzY53EITg9RGpbyH4b+sHyVstcBJzDfQ27u0
	oIaqDCpfaQC3wtMGlKycqaJssUb3Y1zF4irQaMHDPPMD2Es8vRBeEE9iORFumUgIdWgwoG/7XnZ
	0ihxX48XBDnp3eWbiig7eB7Vpn7X7io5OAzCj1wEN+Bw6iwJAJcbjCipVT4Sg8yKdllb3uMCT2Z
	ngmIJExyqUMlJB/FgLlEdAXq0t4he6p+ZJAg9XciemM4YOzO7cTMSyoRCMMWUmLs1+LLPL+m7ko
	5fLpLNXa9z0oOqzZgISAG696zH+DWSkriRKRzC4xxId7A9fk+oU6VetRkvZV5ZUdBW5Q==
X-Received: by 2002:a05:6512:131f:b0:5ae:b130:1e1 with SMTP id 2adb3069b0e04-5b15d78ec38mr1860639e87.28.1784201068733;
        Thu, 16 Jul 2026 04:24:28 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca5002fsm4935914e87.27.2026.07.16.04.24.28
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 04:24:28 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b28ce91111so76656e87.3
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 04:24:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro7yYaPsk4saOSYxEQ2Eld3iHkbE0fVSgnQ/jqdNNRP56S3K6fNQVBkKmcWx5549zqC/ED1kJN/5Wof@lists.linux.dev
X-Received: by 2002:a05:6512:66da:b0:5aa:6f0e:8404 with SMTP id
 2adb3069b0e04-5b15d782523mr1118358e87.21.1784201068106; Thu, 16 Jul 2026
 04:24:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 04:24:27 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 04:24:27 -0700
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: Chen Linxuan <me@black-desk.cn>
X-Mailer: aerc
References: <20260713220932.413004-1-amir73il@gmail.com> <20260713220932.413004-3-amir73il@gmail.com>
 <87wluw2qeh.fsf@wotan.olymp> <CAOQ4uxjzAXgBaggRNJxcEn39LY4+D6ZVHLqODJ3C6cHnDdkG_g@mail.gmail.com>
 <87se5k2des.fsf@wotan.olymp> <CAOQ4uxjakizfBuTYUG-=K+L1MUfaCkwtKUyNh2g_9K2c4u3-Ng@mail.gmail.com>
In-Reply-To: <CAOQ4uxjakizfBuTYUG-=K+L1MUfaCkwtKUyNh2g_9K2c4u3-Ng@mail.gmail.com>
Date: Thu, 16 Jul 2026 04:24:27 -0700
X-Gmail-Original-Message-ID: <CAC1kPDMPfYAUsmT-yx4NK=hT5OdeZuJpyVTbfHZxfdbH8b_=uQ@mail.gmail.com>
X-Gm-Features: AUfX_mxGku0anB5kg196OG0yAhxo-Nz-aiBDpeDvzZ032RF_rOyBv-UA9XtXhaQ
Message-ID: <CAC1kPDMPfYAUsmT-yx4NK=hT5OdeZuJpyVTbfHZxfdbH8b_=uQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests/fuse: add ACL_DONT_CACHE regression test
To: Amir Goldstein <amir73il@gmail.com>, Luis Henriques <luis@igalia.com>
Cc: Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Chen Linxuan <chenlinxuan@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu Jul 16, 2026 at 6:10 PM CST, Amir Goldstein wrote:
> On Wed, Jul 15, 2026 at 10:41=E2=80=AFPM Luis Henriques <luis@igalia.com>=
 wrote:
>>
>> Hi!
>>
>> On Wed, Jul 15 2026, Amir Goldstein wrote:
>>
>> [...]
>> >> A question: in my own tests I have been following a different approac=
h,
>> >> where the filesystem is mounted from a shell script that does the act=
ual
>> >> testing.  I wonder if you think your approach (i.e. writing the actua=
l
>> >> test in C, using the kselftest macros) is the preferred one.
>> >
>> > I always prefer a standalone C program for a selftest.
>> > For fstests naturally the tests are done by the shell scripts,
>> > so it really depends.
>>
>> Cool, thanks.  I'll consider adapting my own tests to have a similar
>> format as this one.
>>
>> >> Anyway, the test looks good to me, and I just have a few minor commen=
ts
>> >> below.
>> >>
>> >> > fuse_acl_cache_test is only built when libfuse3 is detected via
>> >> > pkg-config.
>> >>
>> >> Yeah, I've sent a patch recently converting the only existing test to=
 also
>> >> user fuse3 instead.  Not sure that's acceptable though, since there's=
 a
>> >> chance of breaking some CI.
>> >
>> > I mean if the test is not built it wont run, so I don't know why CI wo=
uld fail.
>> > Obviously some systems do not have libfuse. That's fine by me
>> > not everyone needs to run all the tests.
>>
>> Oh! as usual my comment wasn't clear :-)
>>
>> In fact, my comment wasn't really very relevant in the context of this
>> patch as, in my opinion, I think it's OK for new tests to depend on fuse=
3.
>>
>> I was talking about my own patch[1] which was converting the existing
>> test, which depends on fuse2, to use fuse3.  That's what I was referring
>> to when talking about breaking CI: we could have a scenario where a test
>> was being built and executed and, because it's now using fuse3, it can't
>> be built any more.
>>
>> [1] https://lore.kernel.org/all/20260708131122.2917-3-luis@igalia.com/
>>
>
> CC test author
> I think your concern is exaggerated
> This test is 1 year old. Who runs this test and doesn't have fuse3?

A quick note on why it used fuse2 to begin with: back then there was no
fuse3-based test anywhere in the selftests tree. Amir actually pointed me
to tools/testing/selftests/memfd [1] as the reference to follow, and
that one (both its Makefile and fuse_mnt.c) is built on libfuse2, so I
simply copied that pattern for consistency.

Thanks,
Chen Linxuan

[1] https://lore.kernel.org/all/CAOQ4uxjKFXOKQxPpxtS6G_nR0tpw95w0GiO68UcWg_=
OBhmSY=3DQ@mail.gmail.com/
