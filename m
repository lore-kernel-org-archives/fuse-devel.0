Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA7386575
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 21:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622059; cv=pass; b=OnKZFqIxBRnB7zszGRdbEd5QgVmxDgZIk+hqOOAcbMI3oM56WMhLEjrE+AnUWbWRnUBnS+cGsBpk/PCzrLkRIwOlylNJqnOLjT/eG4ejPVKVd7nMK+vwnRV13tR15ZEv8wMk03nYaePcU0HKuqEbSk5Eim1W/HRpZwkKmL+7OaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622059; c=relaxed/simple;
	bh=jO46bD/DahYyJouYnkfmKNbZfEuWSP4xESEaREtQLrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqH+4A0hD+7DiSpKVdG3Tc50KPN4TFH+DMHDPItgEqakDOg0qfxuBdGzWF7Le54XxX5xdPKpmKOJMeHEcicXRXdbCWi2q+mT16ROUcXujXnf/E9tw4Fm6ociL4wAl9qJRzJRpYw9cYt7p5bFZydN38Vm5pP4fnj/LkMI+dsm3lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iovqcp5N; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iovqcp5N"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so10244615a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 14:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778622056; cv=none;
        d=google.com; s=arc-20240605;
        b=kxOAoP1vkpMcPOZ4AW/SCFCOw9AmtviLNiM96G0dDTOnPkerJVjqSNSxuyrTcqZsua
         4n0eWt/SJaXUcvrFd3LHuLj0AgFWbvPcHBxvJBlLdjsF7FWuBMZZnojQASFzzr+TfJjH
         TZGT6r4+92m4J5rTL22QL0ONb3Ro3co07j0k0Mk0Gj7X1HLFEbA/cfAUfuBRgr8MDrWz
         7nzYVxHk3vP3TPEIzHgXcT3cD3gc6Yv1JpKpsG6iHgQwzUBccce/XQr0u7t1C3S2lPKW
         mhqkXL3Do+Ke71semsUR/rjazKC4OCEnALvF4/+s3FwJoUUGwERImQIwKIQDkGzAXDPB
         teew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HntkDOW/alaXL+qx4nXenVMcscOf6fVg+5VtXbCPfAw=;
        fh=PnM1PFrYZP05BdynEE18QK+ejlBpXZt0lQirxugP4BU=;
        b=jFkFzDAC0qQAPdplhV6R54w1bC3uFa1yFPfmPqXoXn0BzFJKXUh6IttzYbYNSITHER
         3hBNHCtgVO7rZM8qfDJSV4h8T8W9vHBKSPPnIs/oO7xt/xRjrOg4ugwERmKsz+xsiwWH
         MJrV4TvZCyx4B6Uykd3xNLUZAS0aMjGvBASYEEq++zTMsvmqGv+7Mwn2XzARytWKlJA9
         M6ex6FbIeSjAiBBStrl77kIo+D1TGsW3ANmd+e6H3GDQpgeEK0Tx2HNxAHyFvisDmej8
         TxTm1ZRGeaSPqFzn31PxMdltuqdMi+oaoAWUJ39jB7h9J+hAI829ugXGecebeIHTaetX
         eYMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778622056; x=1779226856; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HntkDOW/alaXL+qx4nXenVMcscOf6fVg+5VtXbCPfAw=;
        b=Iovqcp5NOpU8K769o0+kqnLafzjcYTp/ecJqO6RCUOTebocF+HdVlNvruexpvk7iGy
         xdIDpvb1uLNJ/qhixNhIUNT9KyLQJoMSfeiSmzX6WojEwZVpIsxF02YtZoJ6hoYgJ/+D
         Wq//J3GzxLvkkvMIC5P2yBt3UtebC4fDyrkBc0ARpVy8qr5FhqKJ8RBu/BZwalCXxAI7
         IsmTLQ769N1reQ7w/V9Lr23Xos0NQQ20Bqd9d8pW1nQ65SKox4o9uqbZ0uHF2mpax4ox
         3aytXZW6tBUX8zeLKIxMbCN2fRCCGxM5cg+u9j3gnacfrWkuGDSWWsOIEzyQ/ydCbMB8
         uZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778622056; x=1779226856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HntkDOW/alaXL+qx4nXenVMcscOf6fVg+5VtXbCPfAw=;
        b=mFdNZfYQyQulj0b/Fkplxrud6ysM3/Olt+ToSNIWMMSVIF+9aUjk9ijrAilpwJ0ph1
         PI6cUxjw9uLsOsz1ccmU289fHLch7eSO7yy9Esz0UJuWvikoaXDxbSNOF33xikDj7O3F
         MY/MVg+2MaaZvb6pD7JTCRuDQNa3U5x2KbbRJo1Pyw7HfQ6J4EVM3m2HYo6SNDVP8J5J
         vBtM8EuTAoUgSaIjcQ/QU3+m4zIRya5Duja/LxYnCOxosjcdAYciT3pd9ofueuvEK9HT
         aHWVfedz7kBd4fBKGwoHQSw0jxGzUZi3LZl8ZPm/5WQK9IqVqbTBFZwY2J9UPgSmFJ6r
         GLVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SzI3zqWedZQ0d+78vH18NZSRaL76E9lEKlqdHFZaB7JNsVoByr/eKhoiYYSeK8dspuNYIJDnHOEkz@lists.linux.dev
X-Gm-Message-State: AOJu0YwHntfWNV/B0cd7h0bsB8frrmP2I5E3GGvt2tK7pIFxXBQG2IzS
	VputdvATR1mLg4hoAk335OLYG+lamvZ3Nj9TYZfZgS1AwSAlCG/NN30tWrSyIfhU8yfZxwI92g3
	PkpfG7ElJpwo/8Fjonk5OzVAMYFfDfPM=
X-Gm-Gg: Acq92OHeRriASm55vgxCJs0TpDcqqEcSCW/7y8L6SVOabdesBKlOBcVMWe5S4TY9eEM
	riMPPhiXhEy5T+YhkaI28bFdzvI8hMkbW8rNj77oOI7yZpAHxlB7Yjnu3DOyMR/S0J2Ena5iJXd
	8bv62fUZn1kuuOS03eIjq2dm9E6OEX/XY3LKn8kXYpOnfRBELxCPvtI1WMFh0DQDvQnyNQEQVuj
	/RuKeVWiDMf5gqBZcoBvDEaqRnLFylzSnZkxXfYchf9B7ZtiPgh6vHLdqB/EfPj6cpTsw3aI6h5
	Ch/tE3Nu0+Sm4Kme0wCnbRxLNLknBs8ABvS3Scrq
X-Received: by 2002:aa7:dd0f:0:b0:67c:7697:1ee8 with SMTP id
 4fb4d7f45d1cf-682557ef49amr239151a12.5.1778622056246; Tue, 12 May 2026
 14:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
 <CAOQ4uxhnOEkX4qnn0wHMCqWhEeAGTR9rxcw5u_oqGUovuszo0w@mail.gmail.com>
 <943cb464-78f3-44a7-92a7-57a1fe4fbc10@linux.alibaba.com> <CAOQ4uxh4yKEBdgbkfZTVyYM1P8ahALFVJzQCj7ASkrH746_4xw@mail.gmail.com>
 <CAJfpeguR=x+Kf7jd4zyeSoUtbjaPRLhXCRh9wa3c14x+M77kXA@mail.gmail.com>
In-Reply-To: <CAJfpeguR=x+Kf7jd4zyeSoUtbjaPRLhXCRh9wa3c14x+M77kXA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 12 May 2026 23:40:45 +0200
X-Gm-Features: AVHnY4IbE3Bg883Q__tabvfXXxiDKtTVz49xRXuoaDl21VgCxTESGb3OYv1l38Q
Message-ID: <CAOQ4uxiTowEnpQR3-oBXM3Q5uxBf5PXeNu+Qda8CVeD0fTHfXg@mail.gmail.com>
Subject: Re: [post LSFMM summary] where is fuse going?
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Gao Xiang <hsiangkao@linux.alibaba.com>, fuse-devel <fuse-devel@lists.linux.dev>, 
	linux-fsdevel@vger.kernel.org, John Groves <John@groves.net>, 
	Joanne Koong <joannelkoong@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Bernd Schubert <bernd@bsbernd.com>, Horst Birthelmer <horst@birthelmer.de>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 12:01=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Tue, 12 May 2026 at 09:53, Amir Goldstein <amir73il@gmail.com> wrote:
>
> > The problem is only with  fuse_passthrough_mmap().
> > Depending on the workload (?) mmap may not be important and
> > we could fail if trying to map cross-backing-id regions.
>
> mmap(2) is the main entry point into famfs,  so it's very important.
>
> That doesn't work with "traditional" passthrough and needs to do the
> DAX mapping that famfs currently does.
>

Yes, famfs surely needs mmap to multiple daxdev and this is done.

I was referring to Gao's question about dealing with non-dax multi
backing id (const mapped) files.

Thanks,
Amir.
