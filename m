Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1374B367299
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578740; cv=pass; b=IEUhQDa5ROIcdFDA7dkQAWj8L/KJ0u3vitxJLnod5aLhv6oENN0i1GWEZ5DLRWOW+L3vsnW68CFxRUwArnDjVIOpICdhli9eYhzwy0BB3IKxEyoVCwRvim2jwjzSGnGZOsTz5UXJ1qAlBu8t9mtYDb7zTEMl04XP6m+VzQqPS1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578740; c=relaxed/simple;
	bh=nBMJidNHt66HghgmXUZTCEaSRlUL9/FTHnwxbGP1apM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldQePZrHEHN+wTXq2oelo8engh9N/VSd7ctig4CJZ8ZCxTaH5sKdhFDkq9GPKeozTKu1CimNKsRFDMdenQYJgbN89WqU4ACSA9H52IXxkO+oN3rAnQLe6fkiSfFezpgG/LylnVTu32La3lZr84z6CJbEA44cY2/5hCjV1MPk9gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=q6cLf5sV; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="q6cLf5sV"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50e5dbd8e0eso54687221cf.1
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 02:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778578735; cv=none;
        d=google.com; s=arc-20240605;
        b=CNP7hn321pCw6B2MDqusloUVx7O+Hz54uQrBFB1QU5KB9z9h5wsSCwePH9bjEZtn7x
         YijhlcHeHd4tiAl/EdiBMZdJCs5sp2POTx8qhhyna0w9p9Cu0IEjs55N63gQr7rRbQx0
         DnkLKojTWBRwMwr6caQJuBCEw/gOn8+Zj66dGYCM3oqKau6O2ipPqBWiYp+Eaf64sKF7
         VZdP4FGqYMh+6QjtjMFuSMOrzPFxhiR8SX69eRtajQ8Kte+vVDen8fhc3K6MLk5/jpZj
         kQrTKjtxm3NkEbUZNl4NW2oreTLOlacgC4FR93xwNQbTzYM2rGVycUJ42LBhs795XA1Z
         Kbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tudgoBstBgoWV3PkywqJXS+rkKtuXHKcvUGzzQXZQEY=;
        fh=zmxepGyqrtCVfSLTW+tL1FGeDlAraN6cVGr3Fyc8mwk=;
        b=bxWYOv32LRKRdpaDL8UTbVAaSAs2T/7nBfdrTy/QA3Dwv1hl4Ooj1Vs4Ud2DsQcq0P
         MYPX+FRhUDZlo1CMfUmQsstgqaEgvt1VFBGhaEqBft/6z4XMknOyL9OdGgNZkXV/ndD7
         xdMKz5adu+nZb6wRfgyt57p8ESLYwKmZ/Yey3IXdTF0ZGmsr5h+qw2rpDWyHcPHnfk3E
         Lu9d7rxn4S4RIp/kabeWB2eqsT8l+rSDTihQxahO6AiruU28tiPZPH1oD9v5dE5T5tq7
         V3b7tI6b1xZ/o10IGJdOaeOKMuYbec50/BJea21e6t+ldEB1rl0tnjmZFYaczkEUjlbA
         m6SQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1778578735; x=1779183535; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tudgoBstBgoWV3PkywqJXS+rkKtuXHKcvUGzzQXZQEY=;
        b=q6cLf5sVqM4js1doCRgQ5TNhwfrMGJ2M/heW7zcrn/+xOIOIfeeQ+ovfPkO5nyaMmk
         oPh9c1ayKS0DeMUVOKCobrG7lF1S2lRH0Xx3fjGK+o41FI45BHn7KpyaJJXMmTv5HQeD
         zXvinZeIzdUZ4pxZ0bt+4Nhtx220v+P6J17HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778578735; x=1779183535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tudgoBstBgoWV3PkywqJXS+rkKtuXHKcvUGzzQXZQEY=;
        b=rQAUWNPEPypY4Rfi+XQuO/jVaTlZcUjlp1wqgCCV+0+28dlllaZZHj1nsT4tQF7qh2
         UNgVEAF/kv/BtAQqGI7kivkl99lql1JgnKfYnqJe3SyqqJSJnGNTA8BTY6jPxnViHOJ2
         9aUeUk0c8u1Yog+pUaz4n8pOLj5rk8B5UPwgSoVxTioohvAoJVi0Qm4SsbywTzESzaQN
         i5O5h0yTewX00i1nD1lYyQjYH3QofoH2GXlKp43KSt9Ur6emjczyRevRE+XJCLsnb/f1
         Gij0dq4zyHTxvUTu2FaNJUDwQYFTgyTkhJeLtLECBIoW1n9fA/yPuOYuCvOlQAvvCA+O
         AWng==
X-Gm-Message-State: AOJu0Yw2jWrfkmL28LaQJo3cKy2nDdxRzaw52V2I1MEv1Y7sxdO4ytr5
	G0q4b9INY2voorUsoDQ7xyq6rg9qdUvnypDFs9/WfSIyHDW0tXp2O4+pFRrdYz4q/c4Y7VvqoZ7
	TjxO9R9b9fDTCszluhgRRe3ARNPe9cQYV/dxhNsxZuQ==
X-Gm-Gg: Acq92OGZZ/4EBoLkriW6mAHv4LQg483CfhI/l+1+MtchXyogiHzj1n8g9C/zX8thFxy
	h/ClXXK18wUwOzP7ATGDBMm+BmX8HOUaelR/YjawPznAdiJXlMF/7rLDnXEmzryzeFxwCQuN7yh
	7qdy0DbEaML6Z6YfN2kckzu3uww8PTTAmdhaKrz4C+jQ1RARtfWQN01m5LMpbEdIxxdgxnfNVbi
	YzVp6iUhcHgbvY59GnBEsyXSayNLijs91pGkjT8We6KEPKMjJ6IMCLhEBSGDp2HP1ikLgvEap9E
	Jx82th3rD9y26SRaIPaXwBpb2GPkpV7hNa418l+p3Q9TFV+EaQ==
X-Received: by 2002:a05:622a:6105:b0:50f:bd6d:aa2a with SMTP id
 d75a77b69052e-514d1c74edcmr29713291cf.17.1778578734644; Tue, 12 May 2026
 02:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
 <87pl313ni5.fsf@igalia.com>
In-Reply-To: <87pl313ni5.fsf@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 12 May 2026 11:38:43 +0200
X-Gm-Features: AVHnY4LFFEbjeS8dhCWHmDPz0qaSyC1eBRE5sqfnh02Z5C9rnqZ87Ze4nPOvHUQ
Message-ID: <CAJfpeguGGNY-o=p-gpKx0w1KNwKfNKxKMXn2JrjsO1mJfFCJRQ@mail.gmail.com>
Subject: Re: [post LSFMM summary] where is fuse going?
To: Luis Henriques <luis@igalia.com>
Cc: fuse-devel <fuse-devel@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	John Groves <John@groves.net>, Joanne Koong <joannelkoong@gmail.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Bernd Schubert <bernd@bsbernd.com>, Horst Birthelmer <horst@birthelmer.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 18:43, Luis Henriques <luis@igalia.com> wrote:

> I'd like to clarify this: do you see fusex as some sort of staging area
> for features development that would (or could) eventually be merged back
> into the "traditional" FUSE?

Could do that, yes.

> I'm asking because I got under the impression that file handles in
> particular was something that would be desired to have in "traditional"
> FUSE (and that's where I would rather have them TBH).  This would, for
> example, help unbreak nfs exports.

I'm fine with that.  Especially since code can easily be shared between the two.

Thanks,
Miklos
