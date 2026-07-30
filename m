Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E53BFE4F
	for <fuse-devel@lists.linux.dev>; Thu, 30 Jul 2026 20:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785445170; cv=pass; b=cPL2eiYs/hPbH3aQS+nJ98MUjmZuTFjL5igVk3Kl7W5ZAuwzQZv2+Bb5oo6RT8itfQIZm/JZcPAeWXOz89ErVtsNaAUWY+eV21u8+6VU9TpknyrQN4eMGq5Fj1KgKs0+vxrzT733/dSBE/WUw9XlvjjjsGP6gDdWEnGMif/yDjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785445170; c=relaxed/simple;
	bh=TjfWFjcumtGogPzfLKW4RhkCh9Rhh17DgLYBpsrtvDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5gRv1Ei2PfPrJ12qambXyCpPAPetr0oTfRkH2+M38Q2WSA2LornTEkSopxfCYNpTxJP05pMDMQJq/hWyZN76/6yIXsJDF8kWokJUarh5inzeAo8uERkGLaAeRIxV8Hna6/zhCFsZyZ2wK2nOxe0jApsUp4X4XiaC55aw1Kf/1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUj+xBkt; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUj+xBkt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49550ec592cso7807495e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 30 Jul 2026 13:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785445166; cv=none;
        d=google.com; s=arc-20260327;
        b=cK3Pqkk01J21LEOgeE7JtVTMJK+POv34Gyi2uxnDPMlOpzcV1TLmoz0ltJQTbjOvnP
         Ara058zbbMzMlAZmelFQp6UJncEmduDouqaX0aJuWev+20vrIfxu443+baicOI9m4wHL
         pYRkqRVjzyIVh0iEg09J981lsCCqApsHsFJtM09gm/pp2TRasdgIScWxw1w/Sr3lmsQJ
         6gQMZfiCBUMdU9OVX4Mbruca0KAMQ64Q9VPThS1J3A/UL6cYaBddaap3qBcuasv8s9fI
         kGg4VDqn73d72u4W6chStXTzmE4GlX/OiI4HeGBu3m0hJneqEaq0oElU0jN+GWJeUUKv
         5CPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TjfWFjcumtGogPzfLKW4RhkCh9Rhh17DgLYBpsrtvDg=;
        fh=dqf/XsmECX66hZ7MaAUjfgPp0F5xz0580xxIOLsbka4=;
        b=oPFcGxT50ITJiz26bjNhrE6OoGL1DWInHUtF5c93ERuUp328pvqcrZLcfFktnv0fof
         4hNVNCwVmcvjWbJ2I7zjKHxFIKTctX6lJwwu/z7M8WKwMWAGkSGyyR/MLgMrv4GU2W62
         gby2cT/5q5V6H1VQk+/eZC02OJcWSz5u+/ulKHH7xFnrRT94bPs3D/pRTd3CjNffxlgK
         zUB5XQsOFaHBtamhcWoDR8FqGyA/Gp3CLztCjj+8YdMANGgsSKI1ueCI/4sjhk1pHgW1
         D8Q6IZtNkLJkRoIiSFrmEfOZ6K00BMsGJ1JGP5oRTDU3VCA6KBXIzaTYiBVTbpjZYwEA
         JnBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785445166; x=1786049966; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TjfWFjcumtGogPzfLKW4RhkCh9Rhh17DgLYBpsrtvDg=;
        b=qUj+xBkt1s+FJCmxbwynogwR7jNaEiHV/5H1dI8NAaPJkWFswmJTRG2xzdVR4uPHH5
         NX5xX+CEJ60gGdxsv6mNftLD8WrSIJ7NJpNDlp2v53zPyeuTR97CKPAvU3LHUesfujPY
         v07hPmZtBWnR9TdZ5sUWWf4YxZOlGEu6wcvp1G77zji+8A7UqY5eY8iJJiMhDDgQoy3c
         wl2XUSuBfRmqV4NgLKXFpE6boisCsI7xuoiAWRqHtTNi1NIf84WmQa9gMEbxDIxPaYLd
         zbm9oZ6ehJ9i0no7m1ll1iiBafRmlYef5p0abtPIPdaa1Pi9nas8qJMvHC849Bpjrq46
         PgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785445166; x=1786049966;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjfWFjcumtGogPzfLKW4RhkCh9Rhh17DgLYBpsrtvDg=;
        b=R2Se/+gOrr90mCmt04qE/84kpPUW5mwj7ZeaCowa6ENJd1zAzlSySNedq+Wy/qycjn
         71xQ6H3YlcTbPdaAL8H/KnrP6Is9Xma+YFMaggCYVDfd98XJ3O99VwrMXfT6CML2+p8Q
         s+01v0ZxvxMGdJu9x3SyiD15EFwRdCOLY+vpEPqCfISQqoIadAk8Ld2+vlYACPeHDHZX
         932Vn4JCtrK/y4Qpn+QqOme1b4ZnHXvOV67kZUMem8YjL/9Qtyq5WNWvqE7fSJTDa/iu
         wYANcSsJuY4C8JvTAiuKkXbsWpzFaU4er+dUnrXcWY0G5Nmgr5i2MC5UlVhBWf9gkG92
         BQaA==
X-Forwarded-Encrypted: i=1; AHgh+RoY7zuaWN4oULu/u3+Kb5qwXFasEhLa9QnFpBN9lps7GCaDD5HAvFjFP3lakTQa7upueyMDBbvEqtmQ@lists.linux.dev
X-Gm-Message-State: AOJu0YycZv+psu1A+2ril/TGbyleCmBqRXRXZLXcx+OoCOne28eMVfKh
	5GAvNO2NnAkFAgdKvHEGMxX7Y1NLrsgCRXM/enm3oJXnniiIjEQS3YnItg0wguOepf7/45GgKlc
	ehMqBHFw0j8IJ4EqL8OirA0hJ4mjC6KI=
X-Gm-Gg: AR+sD12yzGdq4bmCOp/01VoSe9jx2Oy2alKQcTSp+0MsTZzZd4HBy9+gg8YgNRWasEV
	YByP00/e5QM8/qq2WVNXT+tLbbsEG/twdU1BF1cFHKo/DneDJGCdNSHCkkjho5ppc8xDlbhoIyh
	Cve4wIlMrozVOtwfN5WnhFEenc6mM2qKRYutl65qGNlOnu2LGnQ2lnbfGczh7BORFeBRB193zbA
	gHjhEVZj1Apuv6kfHgyt0AQZYeURe7Aqs8emUdQKf79QHgWDAF+7NC6byGzfjURVX9msri1NbJP
	IrGBVeCGaOs2pnTk/OtLnzIY/dBNn+5V9sf/FX2nwJl830py46x8UAT1zqKzjfgMn6/WhV05ZG9
	WZO0AOWsteD9eiFwxOoe7BPMc
X-Received: by 2002:a05:600c:5641:b0:495:50b6:5a6d with SMTP id
 5b1f17b1804b1-49804c4cc7bmr22571485e9.12.1785445166339; Thu, 30 Jul 2026
 13:59:26 -0700 (PDT)
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
 <CAJfpegtnja6tkOnNPD2WZxu14Dd+UM9AvynsVB_E268iSXLbkQ@mail.gmail.com> <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com>
In-Reply-To: <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 30 Jul 2026 13:59:14 -0700
X-Gm-Features: AUfX_myiGnqGNN965xypoyGuHF_KvdnF6l6Z1HdJgtyCUEVPa6_UpbiR6bYul1c
Message-ID: <CAJnrk1aj4B-T14SMTZhst2XsjOkKWStUj_0cjwHswgYWWuaB4w@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>, John Groves <john@jagalactic.com>, 
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

On Fri, Jul 24, 2026 at 1:23=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> As I understand it, the merge window for 7.3 closes at the end of
> August. Just to summarize, the only things needed to get this into 7.3
> (besides addressing the Sashiko comments) are:
> a) replace FUSE_GET_FMAP with FUSE_NOTIFY_EXTENT_MAP (will also be
> good for famfs in general, saves an extra context switch)
> b) remove FUSE_DEV_IOC_DAXDEV_OPEN and reuse existing
> FUSE_DEV_IOC_BACKING_OPEN (logic for this already supplied in Miklos's
> patch in [1])
> c) remove "config FUSE_FAMFS_DAX"
> d) remove FUSE_DAX_FMAP capability (not 100% sure about this, but
> since the only thing added to the uapi is a new notif type, seems fine
> to exclude this cap flag)
>

John, is your intention still to get this into 7.3 through fuse? If so
and if you're pressed for time, I'm happy to take on the items as
follow-up patches to your series, if that would be helpful.

Thanks,
Joanne
