Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4F37E5CD;
	Mon, 20 Jul 2026 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535407; cv=none; b=cTEp8lko03OsgkXb5zTOghAT5INDK6qkUalM9W0rBj+H3iYnJjuMSOW3BRxJH6YJyikAr3gYlauKu6mhzAZQPUx0kp6ilaS/lsISjprXXebuk4vp3vpJ+SQYQ9LKSfmse3vhPJSzfwSfbhnyycKmUYRaEU4E1iu9MAOt1gQAFLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535407; c=relaxed/simple;
	bh=3A10JEmOST3NItO7VLT5K3KOSS/vnqSOCbDncpnJZSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPkumfLzeykNU1d8vnFdegn15CzdEWMuziP/OaW2kyDOtueaImbLztop12iiweqM2ygtyXV8Rr5WPlPANOYG2why0w/0ySoytdr/Ic+b9CczJZR01puyMpG2RPn+mnKAvpTONAW9pGV379QY+vMKswcZC0wWyMolokoMTXLgppM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fcNrEH/R; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fcNrEH/R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	From:Reply-To; bh=gkcxBwMg6fMOxjU1Auzrz9CiYEaFv4S6qwkkKN6OXo8=; b=fcNrEH/RWkE
	YLIwa41ISx2XHS1h3tUC59K4YPLL7SXp/DuDMgPIa/8L0bKi4tl3p3GmTqf8yxi04Q1SishXgSwJw
	Bk1T/Y5RoSt3gYIG6/E0fKqxQs1D89eh3LIwwDmNWtY/wi2Xqrdqp87qje0k0U2oG8OoBpRnZH8n3
	br7tFUMD9oILavrFVgRQMkWCcptnh3t7Tcc/MUPhomihmZevYhXonVUFOry3ULvKl3MQxlQjqwCC2
	pNKKbIsGE9xrXp8y63Zf/gM5ZY88cyTyyZe+lorQkELL6wV3RYENVenvh56zMsChkHutlsh1AUO0F
	nPVo7zL+FchoTEdl0frbcSQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wljB1-000mK7-4E; Mon, 20 Jul 2026 10:16:39 +0200
Date: Mon, 20 Jul 2026 09:16:35 +0100
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>, fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com, Seth Forshee <sforshee@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH] fuse: cache POSIX ACLs when setting them
Message-ID: <al3ZY2TYw9C6WwB7@igalia.com>
References: <20260701110052.5309-1-luis@igalia.com>
 <CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>
 <87pl16c2z8.fsf@wotan.olymp>
 <CAOQ4uxg-LcCp5_2OGFo71ejJEPc14uL_D6n04jwy3C2GuoWy7g@mail.gmail.com>
 <87o6gp7ot2.fsf@wotan.olymp>
 <CAJfpegt1ObYX+6+GQ+TcWqnwaYRkzUS_YhVwEN3rLYE0NqQWvw@mail.gmail.com>
 <CAOQ4uxjxGeGW=ndKTQ7gWr4N2DJLMxtK4qdhXDFQPrVMMQgDZw@mail.gmail.com>
 <CAJfpegtdZhWLpc12z3khfKyfRK0kAEu1u3j2QtD+_JL4qaRO0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfpegtdZhWLpc12z3khfKyfRK0kAEu1u3j2QtD+_JL4qaRO0A@mail.gmail.com>

On Fri, Jul 17, 2026 at 04:51:47PM +0200, Miklos Szeredi wrote:
> On Fri, 17 Jul 2026 at 16:43, Amir Goldstein <amir73il@gmail.com> wrote:
> 
> > unlikely to matter if we do cache on setacl or unlikely to matter
> > if we don't cache?
> 
> Unlikely to matter that we don't cache setacl, because it should be a
> rare operation, so an additional roundtrip just shouldn't make any
> difference to performance.
> 
> Changing this does carry a small risk of regressions.

Right, I've tried to document this behaviour already [1], as I wasn't sure
this patch would be OK -- I understand why it makes sense to have this extra
hop into user-space and it makes sense to drop this patch.

[1] https://lore.kernel.org/all/20260708131122.2917-2-luis@igalia.com

Cheers,
--
Luis
