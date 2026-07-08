Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489529BD95
	for <fuse-devel@lists.linux.dev>; Wed,  8 Jul 2026 07:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497034; cv=none; b=pbXnggyAhyC6fg44JHweVL7MZneaL7jGYiNVhT9pMPqaKB2Y1ulq4ujif+dswSOyAYCATdresaWoOHtgU5vRHZyLdHE35blFDqYqrpqG+rnkzJnVmfesKIU92bVBzCGeg4uPXX2Nv7ewu5CqdCb2Q1qgEREG17jg4Ft+dNxo3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497034; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH6XLp5Cgm0OscGqueB9zjpzG7YKpI2+hNchT7LFFH4fGvtNy5daOqng5bjunkxf0ZzfTWc/hKsfYfs1EJrsnWUWNsyM3DiEYfP0Tnl4hEv9CaOCwqK61aKOLHQw3dYymRttok219XLSsjHnZSgETDzSXUjeBqXEfFyjNfAZH5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C470F68B05; Wed,  8 Jul 2026 09:50:25 +0200 (CEST)
Date: Wed, 8 Jul 2026 09:50:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: brauner@kernel.org, djwong@kernel.org, miklos@szeredi.hu,
	willy@infradead.org, linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 3/3] fuse: use iomap helper to mark folio uptodate
Message-ID: <20260708075025.GB32452@lst.de>
References: <20260707220450.1200943-1-joannelkoong@gmail.com> <20260707220450.1200943-4-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707220450.1200943-4-joannelkoong@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
