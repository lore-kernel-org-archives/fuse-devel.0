Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D3C33CEA7
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591344; cv=pass; b=tUMgJbNxWXykQoP7qAMLQzwx/Aqd/XhYdV8E80sX0esIYV3sDoUFTX1hNuMZQ+K8CD3mD7Y1GebWvU5gLx+sbDYeTmIHCPQACZUCKu0DTUkbQ5Fym0jK+K61ghb7Fqgz0hwsMDDA3qpYGZ+PWpOAueQuMRLdzBexqDP8ENqoko8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591344; c=relaxed/simple;
	bh=mo49/bwIycAKmpSP+V6WX3/6DK2iyEaRqfrdokj7b6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRDg80LPa9zT94lebrkcNo2LHNqtxherePhztfGCslKIKIyAVPst1EEsnFwIo0MDcGijg5G1mreipu34fjWzIGzt8MbqOyY9g/QPRB7+sjr3hs4qi75RzGqgxjodMgVYGd/NyHS70RovQ0mSRNrbPbT3DeCtuXtfQdSRQHw1FvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5P2Z8iR; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5P2Z8iR"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bcceb394417so359711666b.0
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 06:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778591341; cv=none;
        d=google.com; s=arc-20240605;
        b=FQ6oj4pjX8gkuTJFDhSiiaJpO9Eb4H3ahOyygyajYaD8qSdNQO8vB9a6uYJiCsUcPg
         YmnOJMoGJ9TFRgsAOr3Zml/9Mnaw3T6PijnTORBc1+ND1W53G4NCjfq880RJgDTptTyo
         aqkLXASdqUzSpHcxjikrsl64Zim2SX3Q1hQZi74cI/dZFRtgO2DmIyM9/W+Vv4HVbI92
         T1LjHz4mEdTthBTIaQNT+JQhBNsf8sci3ZqNyktd+rdu9roD2HhhbKgwChZOdxxO01ut
         jv2lxkMeufm1KJyaRnKaFkU1U2jR/g+aucGOZ/13K9YhgPkiqWGbjF6cu6j5Jn8Ej1r8
         URuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2qBWjjaW/pbuvKmNqOdQeu4n6soD8yZr6RME3HLH1bE=;
        fh=A5jqIGeitmoXH9K0ZeI9mQErJkuR+VWd5Bqw4WL5GnI=;
        b=i05aGxNc5nmNGl2M4oTmaEHd2uv/xzt3+BVxrt2vcIjsoN515ADj1LP57Y1Zx0r8sX
         pWOEcy7eak6n/eZZaJWVJAfs5hCFMaLClajA0NBw+urhJeuRmijm8IbKVIN5H2sK0VQv
         NrVAzU+8lh4aFbyJLAq636DMTOtTWu2YFAHcsQOccXeQ6EaTrDX7LAk6dgYBbu2F6MaQ
         QPf9YToxP6MInJGGtY7h+etldN0esWd5bn+tUmlnvHzDfTce2mt3XhRJ77eXZWLWMKoD
         ZZGckmFmF4xP00cWojXlO2Wje/n+HY3fT6jpsL7cOOfJwkI4TIvduLyPvj2Ay1rP6D9g
         sgTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778591341; x=1779196141; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qBWjjaW/pbuvKmNqOdQeu4n6soD8yZr6RME3HLH1bE=;
        b=d5P2Z8iRUCsLq6RBVXAxTChmYB14z0V65f0GEkcqdDpl6M9LfT1bfGzMA13+7LLhrK
         Sk2H3TATTdkF7pjB55Zfuei+4QxFxQCAspCpn7pNEchhGyGMJhzwtIzDNLCUZRPjjdGA
         xl8o8h+ZbHjd6qsKu4zVx1mHfqOzV00YefUgEhVUJUhc2lMOESVFUmez9gLLym9Bxlhc
         sKoj9MVyp6z+GTCz/n+sxyL9WbFcgmUT9NUNJNhD6jHMN3p3+irVGsIsxYprDBIpDMao
         RF6+osbJloXLgL10TkWsY26hemKHK+fqD/oZpfTYK32pEgBweNHR4V3u9uJJ0gocPLEl
         oKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591341; x=1779196141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2qBWjjaW/pbuvKmNqOdQeu4n6soD8yZr6RME3HLH1bE=;
        b=Gy9d7mtPGWNfna4KEk4NfXxBagrlCwt8HPm1+ypUYxXp/6CDzkwsYLrIJKuRl37Iak
         Ter5ZZAUjz03beQh/2aIQgSKT3Je+cAJSrnzGwuS8oVb6SrIqOdLyEiFCwJgMu8dviM1
         wgDSVQStey66LoYO2yTfO+zzQEj+HbslbL5bgQgOxEvBXL3Qxxy0Q8QhBq/UY8uFpSVA
         hD48mso4d3moMgWraWniVD/AEIanEgGH8z7iw0kCLpHSu2T3B/d3UmAN0GzGKIyRlPxC
         uUNYM+u/v4NN9bYJ5K5jdZtNMwPQH28SIACignekXRJ234eVFeOZP6V83d8y5aijmCO8
         J8pQ==
X-Forwarded-Encrypted: i=1; AFNElJ8h0CFS+Uvo8kEZG38kyRTUOZJoX4l1uD3ICFP3fTZBzHGdoKs8cJcE5cFjLKVb7Q4xAndtwpnoqQG2@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/TllmE63Isq5ZwzuQjLdjq9rOE8MnS/pzEDIEdtZGmDpaA3Ir
	f5Jf2PgzljtjDak2yaojcyl/oOTrNYwvrJdgErZVQpMnfsbjCh2XZQNcoyhwbcZapAPgr7IsvUz
	mbIP/pdVYUC+jWOM5/CAnWkWUVLW6buo=
X-Gm-Gg: Acq92OEPy19pCTuQmlbN9a2+D1UcK7Atc9708uwK2ByybxLocmPsNhf1csX3uG+lJim
	yJbUJCaDWE6zum8y5InlBh7jcvH2Wa51qpBAeILXv2hFP9ba4DLehoreqgCnSFh73+aY80AdUJ6
	o7q6pGVq1la0EEgNkayd8rUrNXOptDtcOxI/NvJ3t+Bbvz5+DGI9vjGpGwDpIDXccPEkfs68uXt
	JF5/bG/72gLtC2+kqz9ZLN1RqHC3Gzy922L/h/OgwwgGKJB7+VvP+mQGZwTW9h6JSrlEG72iLpN
	NscaEFufW9XpdaggREJcdgf76SwKdpk6JWwiGvG7
X-Received: by 2002:a17:907:9806:b0:bc3:783f:1da9 with SMTP id
 a640c23a62f3a-bd28f692fdbmr186838366b.33.1778591340776; Tue, 12 May 2026
 06:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <afxK2HSiwY32KaWw@fedora>
 <CAOQ4uxg-tgCmJkjFAQ86_xB7dDQKGy=geKAcxT2vB8cUSEKdPQ@mail.gmail.com> <CAJfpegt7hj=WDKKASjWLVG-R2tGYUKMJ1qR0iv_Y+GaYS0mW4w@mail.gmail.com>
In-Reply-To: <CAJfpegt7hj=WDKKASjWLVG-R2tGYUKMJ1qR0iv_Y+GaYS0mW4w@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 12 May 2026 15:08:47 +0200
X-Gm-Features: AVHnY4JhU96zGLWsyuK7ihmNJ28PAQ9LCLpUgSWFv5s7IHoqjEj5a1B2ZwVtsLM
Message-ID: <CAOQ4uxgoavKU6zNMN9YF5cchvux6CGGxd56BBOJFWX0gkVAChg@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Horst Birthelmer <horst@birthelmer.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 10:18=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> > I see no reason for fusex to not support lookup by ".", which is
> > anyway needed for "reconnect", so a fresh FUSEX_NFS_EXPORT opt-in
> > for "re-export to NFS" may make more sense.
>
> Why add reconnect?  If server supports persistent file handles, and
> all req's get the file handle, then no state (nodeid) needs to be
> stored by the server.
>

Yes, we are saying the same thing.
What I am saying is that legacy fuse has FUSE_EXPORT_SUPPORT
which means server supports lookup of "." which libfuse always enabled
and then we added FUSE_NO_EXPORT_SUPPORT to opt-out of nfs export.

I am saying that in FUSEX, lookup "." support is implied.
And that nfs export should always be opt-in (FUSEX_NFS_EXPORT).

Thanks,
Amir.
