Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E613EF66A
	for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181292; cv=pass; b=sDl05XTib7RPwp/SH3iZxBuC8FbNX2hYC8ISVSlNJgMZyDLV9WmMhT+YIjGzezHIadCl367xH8fhl8Katp1pb6NO7rne6XzDSFzsRQxPXjPegwhmHzHGtgpV9Y8TN03TcWZkEnc959eHqZdl13EFp4ayqxc2IEmMJ88HB/bKJDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181292; c=relaxed/simple;
	bh=71YTs91AShIRqM+RzMh5Wuj+0ahof4Ja5sI1rjvb568=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjWD9HlW6sUF4liMUzUYa+UpyXDNasSfFjd8Dp/MGUhL1APRwll6TOurU+cOHKeAc40XHYdd88Hbv57DgXB05tBVv2mFMMDKJm8FQWmME7pc8555QRX30PIG28icbMGMnce4ugU4uxzyOIdDhTD7tYAjnCsS4ddBoQRFq3ETBzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=kJSx1M8i; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="kJSx1M8i"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5102582e237so32887771cf.2
        for <fuse-devel@lists.linux.dev>; Tue, 19 May 2026 02:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779181289; cv=none;
        d=google.com; s=arc-20240605;
        b=McMFcgCSV2IxgNtTHaH68YiwohQAgfb/miVLumM3tbSW4+Yq8gqebue0uF7L619JkJ
         LJ/HeE61yuRCR+nIOWHAC+XlhjeR3yFV3wJarWtKNQuu37TmngABzvx+HTiOzcsvk7zh
         NZE1PQOVdty6GdGd0I+VrAMbKO3tL2EJgKxway44rMY1rXBHHMSAvB6Ou7JG3AxIdVLu
         YI7Ve3N5jc+ciUVhkFIVem0ImNN6itYxMNWceI+7llzbh4rRxbftU8D83hvYfx4E+gvf
         loTbhLK6ymVtdDo4+Ha7DrEDHBlExb7+hb1QujDS7+0e1ikshcPA3z7rT/wRdTbWvz42
         FLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=brclgwnPsvY2TI5Nbw2Le51G4FBqZeBYxMWIMJT0ReA=;
        fh=AJme7Cj1fWqabGHfAdRjhmwAykT7F/T5vAV9OwEXE4Q=;
        b=F7Kou8luwx9pwPeksXe/oF7Sr+onc17UPI8x/vjUvAvfAepr72xvHN52TBfbMuSMfp
         NtQN8jz9qDqzt27FHl/7zO6Yqb1NmMr09FiOmTF5URDXMF6P8WeqcODidmJyoJ8gInwA
         ueNGyMIPHjxVxZ7Qq70tcMp6qc7HYWL6l6QgTWuEL4+VJmRHXb+IVaq/Lezc3g2UVx5V
         E7zsF2gA7r9n15cs99gXDbzMyHe9/XlYyyYZrPulJzBrqm30226X4vBrFPp82A5f49sN
         b/6mYw9xG0CqC5gFneA0TyvohN3YfFUuhTnlycmSQLcx+KcgzCJIoLa4dyKO136fWzyz
         rl/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1779181289; x=1779786089; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=brclgwnPsvY2TI5Nbw2Le51G4FBqZeBYxMWIMJT0ReA=;
        b=kJSx1M8iRfZll3RVIGMoG/gsriTnp1s1gwtp1G3jIupAJMOkK71EW5KgnMufziFNfN
         2U3gJ0750HQYP6yut10J7/ebUqjPVLEKebhW5afxHD92p5VlPDntpPkD9S+1NkLWQ/fl
         4E1dSDwrXG0cwEEnpyx9ortdUme8tcSOLAkFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181289; x=1779786089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brclgwnPsvY2TI5Nbw2Le51G4FBqZeBYxMWIMJT0ReA=;
        b=BEFc/dfmScEeiFAA61y7lsZmIQnmJyrfxQ9tO6WJATDJdN2maxYrT52uAj/IXS/kCq
         oc+0lMn3Dwryii/Dhwyt8pj5OlWFpoBMClTMRlVH3cyGe+YFaYkL1AnPnpvBqne048vQ
         gRIak+l8o35xtk9E+0PB5tGJbAzvEA0rdhtjnWhRGQZ2TBz0JTOUHfo6rTq3dLkXcybV
         4ukEoNf27Qup9kvDTeS+7MikcZhHGWuwOvLl9svlitnqTpJGz3A/RtDAst8dW4p9XBrm
         ZhQCm97/Jju6H9ZakXnxWMimoCe7b2UiuIrlYiadC/5LPH/ZMrb6OyTFDc+R5Yjs1RR9
         bIqg==
X-Gm-Message-State: AOJu0Yy+OVkUYvxTn61GWKnYnfpG75avxKfTgV3CLTi7Yg4cA07pnMIG
	kA4He9WC9gyn2SBR+9xPhcuJ+qVJAQKbhxDdvwmCb7e/13kRGYQh4dAskNze/0ctz2jWj2wuM85
	1v7Dz2X+yEbFPd0Tpg4wuaEOeC2zTzGJOEOR07w8kbA==
X-Gm-Gg: Acq92OEtmRV3w3v+w2Jwi9yngaWAoiYObjpFMi01fs8wl6IpmSH4nbKfFQKCnZncKxw
	I648gZIpcJqT5M0DLEdWmZeGoM8jBFZ/kCXDV3VNcHDBNeKyDu2whURiFV4CEgFFqHLFTLDcAyN
	reGfjKe9CrxuHTbljR51nbsQK3Cp9bbv8FwucKacpFv/IwxOLy6wPqiu8dFqftgl5WUQZj+954t
	UpbHtjJTAIXefEQkl1S5wjYNEvx/Z9zCSv+b+kNUkEdkOJAWTeHufBRFb+2P8prO52KIV0L98Un
	XDXULImlbQxQOY9noQrW/ovwOIh6+hD2/mnZGHf1bFHZzkYUOw==
X-Received: by 2002:ac8:7d0c:0:b0:50d:7cd4:4a6d with SMTP id
 d75a77b69052e-5165a22c1aemr235062331cf.49.1779181289549; Tue, 19 May 2026
 02:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
 <20260512202336.GC9544@frogsfrogsfrogs>
In-Reply-To: <20260512202336.GC9544@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 19 May 2026 11:01:18 +0200
X-Gm-Features: AVHnY4LsGJ3qV09PcitXoBwW0H05KllqaSmlQMSmtqW0itEPLsn77ekk5RfHJ2g
Message-ID: <CAJfpegsPqja+MzfmvCE5054y9pv1_cwPRH2uGmFws-wwxJmrZQ@mail.gmail.com>
Subject: Re: [post LSFMM summary] where is fuse going?
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel <fuse-devel@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	John Groves <John@groves.net>, Joanne Koong <joannelkoong@gmail.com>, 
	Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 22:23, Darrick J. Wong <djwong@kernel.org> wrote:

> As for fuse-iomap I'm not sure how to proceed

I will try to dedicate this week to reviewing fuse-iomap, hopefully
without too many distractions.

>  -- in the long run I think
> it would be cleaner if each file IO path (virtiofs dax, passthrough,
> writeback_cache, iomap, and whatever we call the original one) had its
> own file_operations.  But that would require us to refactor the common
> code chunks from each file operation function into a bunch of smaller
> functions, which I think would sharply increase the review backlog.

And so the plan is rather to basically start from scratch and do that
form the beginning in fusex code.

Thanks,
Miklos
