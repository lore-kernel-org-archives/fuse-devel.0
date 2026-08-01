Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A04C42A80
	for <fuse-devel@lists.linux.dev>; Sat,  1 Aug 2026 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785610941; cv=pass; b=DOQHRzvoIT4QDjwynBEia5ERNeWFdXYHoQUr8GjPC2GzKrhwEn8EngAKuUlK2GTPD7OMwBqc09Ge92bC5gOhiByajGMo/3VvVRSekqS5Cc6CMg0ApkAcBIOEfSv1Rb1yr3a5LGsIMHy6/QvAjJW7iIyuLi6PEMgQYPHFxHzrw3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785610941; c=relaxed/simple;
	bh=nivli2INTpQAZY/8TzmpQ6V0d9mAXZr2We8tZu0CLGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPwAg5UBaRDDpYf+INHRuSnlG/bLIs+DuT1KSUuj65cb7xdkw4XKaWnqEECndXnmbam3oIOME7zYJvA8dto5x9S66LCzd+HjPyP7ALjh2KcGQe4YW4aC+0zhBbgxxvQ/MuyLOoPsLNvcxLTBm4EchH+hrPtAXgTXVESvmWPm5jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv/sV+Nz; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv/sV+Nz"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so591723a12.0
        for <fuse-devel@lists.linux.dev>; Sat, 01 Aug 2026 12:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785610938; cv=none;
        d=google.com; s=arc-20260327;
        b=XCtXCNH4k8FCzQAmZ7u7Q8EK+tzIzjxwdpbhw19+imxWFxlLRLfYx1aqSv6a7uyrrP
         M8uT5W9XIAtxSAl1JrISV7fMazJDiUFdrcdPioPnzPfhuyzW0rPA+CJA2+KvSc0Zr7xg
         CXXdYDX++rRCbASD8mLvApKQipUpGp5LagoJyE3GSGOmur0M4EgzmrQt0KocbB7cF0ys
         uYosEh1uz3A6Ph8ZXFkikFEQTmYp3eWmNq9T3tkjFnrlSn9s+l1TTlu6Gy9naTon4T31
         s8lsDUyDraH6xw1Q9JQLQF3y5SpLDCwwAsvnTBaauwlE2V5E2H1MgaVLULqkn/IHQW52
         6nYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nivli2INTpQAZY/8TzmpQ6V0d9mAXZr2We8tZu0CLGU=;
        fh=IqZCJsxAS0eJH67X+I8569IWio9maNZiGm+fuu33a+8=;
        b=PjOSMyrvcX+ojsXH2kogCurudnyf4MJSwAxLJgSA7f8BBxE1/bllGmaaUKPYjiP2uI
         gOe19sjP/vA5jL6iK3TNAnR8QScMb8683AZ7oCBm86bCU+5cWplGTQ5SW6VLNayCU6M0
         FqivIVVSpnZSjBUnTvy1Aw7ZRhXNSUoR/t7UHWMhrVjRflV5IC9zQr32qLfUfHqGwQng
         aSYyPlNzmszJf5S6In79K4Rn7Lo/pVcy81XEESdv3WqM13LflMA7ycvtbM7tS6P3XUAZ
         V//q21D9S4jUdbKauG9oQohfULUy63GgNTLKSWP9AFFiEHlm5sC+tAbWFNMIp1dJs1dd
         0bzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785610938; x=1786215738; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nivli2INTpQAZY/8TzmpQ6V0d9mAXZr2We8tZu0CLGU=;
        b=Dv/sV+NznOyhu/4CxFrXIogvlUcEGaWGd0AY9bAZRBabjqUESS/E5wlUp73rMTRsbe
         9+ylHXogwoQzEKkrSo0q0pvPNv8XyYURvKWwry1NqdIA5s7qjhby1HumOM3ByBm7g1A6
         9JEsxNcFKG98AEvbRfqbnTterlKhPCn9H2FhKVosWPjhAoBNleU/L9bJw3EEWCpZvHSC
         hw7M65ULw+kVw3xsjlpGYZVXnWbkg92Z11BCRlOmN3BH8eSq/J/u5TYmsbAvdN2OUaR4
         zFVCwRCncdvXLOV1vftwf2aNDkDK0V3outmTwZIvaUCMd4PSXy9IrU97jVKWSnaIdGEL
         C3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785610938; x=1786215738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nivli2INTpQAZY/8TzmpQ6V0d9mAXZr2We8tZu0CLGU=;
        b=gu4YeSFWTRFlb2TLg3NgDtQskOJrIyXtnryncNkndp4uEzofnRaIC9zi5Cs7J52Y+u
         BPALNNiOANSW0lhY1a1h6IrJi+ahqafQwdzbdroecIBnycN8Y55tBoZQU8Mi7IAScFyZ
         nH4zm22K8IhpIkQWtn2CYUDNq7KLNhyhvAl74pzmfUx+cd2qtQgAXsZ4V7gIy9gqsVAi
         PVSF7q4v81WEhJH0TNLFRdv/vFOwghi56rvpZlAe3YvIWTx/76qwVGJ4TXEJ/1HSi6CI
         PrK2i++a1S6nioqxfP+KUV18Sj+gMesWprKEbm7YxgzYsDSP7USV0z35vGqbTpVq5206
         rL5w==
X-Forwarded-Encrypted: i=1; AHgh+RrgMa3eIxy0oxa9LRUIHcBQjeh4cLpn4MLjAKyez2zt0pCL0Pn3GvIIT7+pSxEU+9AW5MZ66v3kE0CH@lists.linux.dev
X-Gm-Message-State: AOJu0YyQR93G40GqIUonhV8xsdF6zys7s2koOvai5PQiP5TsxYL05ELH
	lpMXG4O2pEESuEaKu3yAVe065uitVHKwpElcSFXh6yqSF3fvlbrz+oLHBRXpqCJDmOEto+FEZRA
	IJA0QPynxuvyhn0/WJQcQGkMxUbswqXY=
X-Gm-Gg: AR+sD115bm1i8ZVOFpwNNQfR6KB6ksSsJRvGxvyoQPDwzDLBIB9Mt0xiMk0ZbWCxUuP
	Sr8bTslzsdPwbcFhqICagBo97Lk3ezcV2Xoj0vdWBSZ7TtE10yYSjk3MVyUbg/sV+Wy/mhu87u5
	+CY5yZ1lux8DrKVHICUDIqNH1seZ9iou8wg/b1fZeaDHuSJ/4O2RYtg87iM/gCPBhOFn09u8Qzj
	DGj+NEhZ63/qNSMiGr2qn+rhKpVUIRHAWgaBzIC97G25DG3/lJRrxPf/n16m/aCkB77exID1fT6
	Mr9ovt+WKWdZ1zxfObvyDms6iU6WwfbrT9nX9b65wlnW02Y=
X-Received: by 2002:a05:6402:449a:b0:697:de29:c802 with SMTP id
 4fb4d7f45d1cf-6a0a7ccb364mr2898579a12.18.1785610937994; Sat, 01 Aug 2026
 12:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
 <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
 <CAOQ4uxhuivjMMt_Dm3VwKmOhHg7ZHdAww6j6jp+RMjPoRde+bA@mail.gmail.com>
 <CAJnrk1Yat+SEr=SmZXwUt9y2WcC0VEC4KUpPrkrRSjMEmx42WQ@mail.gmail.com>
 <CAJfpegtnja6tkOnNPD2WZxu14Dd+UM9AvynsVB_E268iSXLbkQ@mail.gmail.com>
 <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com> <CAJnrk1aj4B-T14SMTZhst2XsjOkKWStUj_0cjwHswgYWWuaB4w@mail.gmail.com>
In-Reply-To: <CAJnrk1aj4B-T14SMTZhst2XsjOkKWStUj_0cjwHswgYWWuaB4w@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 1 Aug 2026 21:02:06 +0200
X-Gm-Features: AUfX_mx0nmQgWA50AjJPZwCEcEACcDvMhxSi5YeCpVu2bWW7aLZWp00XQH36_Y0
Message-ID: <CAOQ4uxhop5bzpDxiqSdfHS8JyUASfAmpsmuhrpq7Ey28jATVsw@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, John Groves <john@jagalactic.com>, 
	John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 10:59=E2=80=AFPM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Fri, Jul 24, 2026 at 1:23=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > As I understand it, the merge window for 7.3 closes at the end of
> > August. Just to summarize, the only things needed to get this into 7.3
> > (besides addressing the Sashiko comments) are:
> > a) replace FUSE_GET_FMAP with FUSE_NOTIFY_EXTENT_MAP (will also be
> > good for famfs in general, saves an extra context switch)
> > b) remove FUSE_DEV_IOC_DAXDEV_OPEN and reuse existing
> > FUSE_DEV_IOC_BACKING_OPEN (logic for this already supplied in Miklos's
> > patch in [1])
> > c) remove "config FUSE_FAMFS_DAX"
> > d) remove FUSE_DAX_FMAP capability (not 100% sure about this, but
> > since the only thing added to the uapi is a new notif type, seems fine
> > to exclude this cap flag)
> >

FWIW I'd rather keep the explicit negotiation flag and make it mutually
exclusive with FUSE_PASSTHROUGH (anything else)?

This will allow us reuse of fuse_passthrough infrastructure with less
concern about mixing the two use cases, which at this point seem
like two different use cases.

Thanks,
Amir.
