Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524E2EEE65
	for <fuse-devel@lists.linux.dev>; Fri, 26 Jun 2026 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485494; cv=pass; b=qXJLSduH+z7xSYLLquXMLnolQ3xU/QcGw4vvzc2J9eJGdCJeqAriEazHPXgHYpxRAQT6+2CQCmTFCtWP9h0j0CyMyJM9m9TwTHrKIcuvn6LWnx95wNUnTuIY1nDQlERApX7slVC6b3PZtXmJ3volULuixhpVGhzOgcnxWPKOlDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485494; c=relaxed/simple;
	bh=F/vTTa+gFZE1/PfB4U5xRpdZYv0DcxHltEmaOMRgRKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHR5Ari/PoKFBCSixD+Sm02hr7FiopPa0QInDZhzmY+rfGpSaIwK20F8UNv8zKyMcNBHIw6DO/nwO5VwxsxxIuoHNYyDsNBs4rYgtmkRRI+1sxwcrCMageYmNC8hsoKASQad/xUW3lfZ5PriK2RhEO0398R3dgCX+KWfBhA2Qkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TE/sSLn9; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TE/sSLn9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46caaa805b2so677522f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 26 Jun 2026 07:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782485491; cv=none;
        d=google.com; s=arc-20260327;
        b=Fj9Dvjl54/OG5E2yGP4M68ViwAhj8eal6OSj7IkOKmpMMfQRsvZfNhb7+QJdli8yCN
         IShphu3Q0o6GueBV/WyEF4ZbenYEfjDd5wxFDghGAg1kWuV/DnyHqGVQcFokiX057FE9
         Yp9yGrB1UJetP6M4+k8oci32pvDSjjOlWP/fd5FpgRFX5aRB6E1k7CCac35RIYz8gdDs
         mCsAA1SWRJ++4Qt+FMyZ7pino6l12U7324oStpg+CYgGRT3Cn1xgGELsLLd2SKb9UNZz
         9YxL8VEZ2DHagayiFvbmA+tCj03LyC5NVQYt4EG9ZveRAAG9/xfOigozKjSSGLGRj3hm
         9giA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qEFu/GsLUdYzJ5HEI3yfKh2VsiakBP97CsT9SHwpvI8=;
        fh=kRO+z8ux6nRcC+baKtAcGxSDOWNFcN5gNEEwqI8xqvs=;
        b=BXGLEwyYD1PVVsl4ig4+RuCKPmrzBFOaRtDMBDVVQh/fhlciEhr/xAiyz9DfGRF4MJ
         qOUoP8eapP/FQA25+MMetQFAOFzbdtOBhbUeMCfMqJMJJnvN48U26z5spvAbOFqrEGeu
         Rc3nRuhh+JzaOEbwzoB5BSg7a2sf8lkmRWUIWFyhYrPpM4iHLdEqhwHAjYauxYvrf7Uf
         jcYPc3DR/PEJf94PiB6dOaWU3+rXlqo2bmp6+USTXjmVIg18OjYaaX+DTtuaPU/pX3eW
         wBHKc2k1xxBAgSAkuFhCHP12rft97Oc6FuEIxYmOrnD0LHfBuOifw5f/dj17qM4lDNaI
         nL0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782485491; x=1783090291; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEFu/GsLUdYzJ5HEI3yfKh2VsiakBP97CsT9SHwpvI8=;
        b=TE/sSLn9rhUsmECMVsJbwYP4y3lNLdSg2+jKJUm7n48Surz1PjGQVbQCoOuHzmncE+
         fZixXoJVekOw4+/crlWnoyCKz6Y62+FxGcAtlbmonJw1xJ6T28PJYP/ETb/vRDTbDKRl
         go5DxYEXe1bWEBRXyEo+AOVLtnp4iBuTBTDY2JWHvfqvj0YjSTmc2nCbP+AJ+HT1e8TJ
         se8pjOq6sl24mH8lZsfM20W4X1CAhU449zXh111Lt6t55m4pv2lPlE67p8Jd2WrnYz4L
         i3/FgFt6ouhrIWstd/YfUGA9HShmNEpXexjwczuolfV5gCad0xsb7/VizkjY991vwPQt
         eDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782485491; x=1783090291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qEFu/GsLUdYzJ5HEI3yfKh2VsiakBP97CsT9SHwpvI8=;
        b=kBMZ4lCNAeAGTdsrECn7oHNI62fLa9wbAhBfwfeaespiskvD5vvZYRRfkv+tB7bcX9
         XiIQBqzXHQvUY1JCu6Xi8GPjGFzUnQ1BKWIhZTJQIHLwO4dkbEYzvi7c4xY02oJ/zcap
         iLtplzJey15XMLR5mSznKShTZmPLaQaiJLvQ3BJNbWe+Py5p6G7dxgP6fZO1jOUMc2Bv
         EdlQrVLC9rWAgO500JOYiXY47wUySveN+UhZ6ajjF0hS+GEzZ7ZFeH4eONsKKmx+k35f
         Gvs/i9JQ0gHpAIYqddMT3xPs7ee9e6HldAzhb9QlYr6Q9kyKrZq0BBuFhDW/8etDfa+0
         7/pA==
X-Forwarded-Encrypted: i=1; AHgh+RrVNtiJAIDYZJGGDKI7bzKdhndYZFdCJj2Em4eXPgvwKvmegzfPNo8rLwLFuvb3CIZSvDJARUY0sAit@lists.linux.dev
X-Gm-Message-State: AOJu0YxGyWspuzeyJN2vwIgoWSRv7zPTFW2trCwqWGT9SeE7DS/jn+4e
	Mvx8oEcfZZaCl10f8DyP4uT/s12MD/81V3gN9TUp0Mr0ZFZiPhRy/WABRWQ88bH4toV8k0c+XSV
	lTAIBxalwlRfofxVrUGvrNqu/mMBQSfA=
X-Gm-Gg: AfdE7cke926snnhW4p2yKjqh1bGFO88wEk48TXRgHjpkXTrLdFPKS/WNNoSk0ughxad
	x+3OWH2Gx1o6O/6Q6f1fn0fYtu4+ksTu9FqlKK8rTZC+w/UC1r9uwbJZEb8CbpOP4VwZmGN5146
	H3nb+P2gYJuRN8EcAFCAY2Awd9/wz6SWGJwDWxpWVZMq8WlNyEiTbLXdKCzfPkZbZJPsGWJA7Qg
	ctRt2Ze0Kc01qDvU0bYFfgfLOFVsCu6IxVBOLSbFg/Rd55bpD6vXOsTt/JFmhtrOLR6kmL2TS4p
	SELoQeNaIj+zACazUxSagdqEr9nWmDbCaa9s54/4g339t7eKd8VP18CCMp+PENY=
X-Received: by 2002:a05:6000:4b1b:b0:469:3037:37d6 with SMTP id
 ffacd0b85a97d-46dbed361c5mr11889497f8f.2.1782485490511; Fri, 26 Jun 2026
 07:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625120803.2462291-1-hch@lst.de> <20260625120803.2462291-3-hch@lst.de>
 <20260625174758.GE6078@frogsfrogsfrogs> <CAJnrk1YFeirQ4g7qcVsda-8qPLeAtoiyW6ZBuJb2qDsGpxi-tg@mail.gmail.com>
 <20260626043319.GC8078@lst.de> <20260626061637.GA10337@lst.de>
In-Reply-To: <20260626061637.GA10337@lst.de>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 26 Jun 2026 07:51:18 -0700
X-Gm-Features: AVVi8CdX3YEuehBm4GMevCFp3lRCSJHGYeePQFfRezoeBrVyeHAViWscCz8GoDk
Message-ID: <CAJnrk1aJbQ0092f=wcTu8v62rdxZ7-NxyF-1vp2e42oSEo6LBA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iomap: submit read bio after each extent
To: Christoph Hellwig <hch@lst.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Christian Brauner <brauner@kernel.org>, Kelu Ye <yekelu1@huawei.com>, 
	Yifan Zhao <zhaoyifan28@huawei.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 11:16=E2=80=AFPM Christoph Hellwig <hch@lst.de> wro=
te:
>
> On Fri, Jun 26, 2026 at 06:33:19AM +0200, Christoph Hellwig wrote:
> > On Thu, Jun 25, 2026 at 11:32:40AM -0700, Joanne Koong wrote:
> > > Yes, that works. I think that's a good idea. fuse only needs
> > > submit_read logic for readahead. The change would just be:
> >
> > A nice, I'll fold that in.
>
> Btw, can I get a signoff from you for this?  It looks like splitting
> this into a separate patch actually works better.  If you have a
> preferred commit log I'd take that as well instead of mine.
>
> This is what I'm currently testing:
>
> https://git.infradead.org/?p=3Dusers/hch/misc.git;a=3Dshortlog;h=3Drefs/h=
eads/iomap-read-submit-bio

The submit_read logic is only needed for readahead. We can remove the

+       if (data.ia)
+               fuse_send_readpages(data.ia, data.file, data.nr_bytes,
+                                   data.fc->async_read);

change to fuse_read_folio().

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Thanks,
Joanne
